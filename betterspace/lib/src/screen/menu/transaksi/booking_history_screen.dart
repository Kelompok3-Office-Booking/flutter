import 'package:betterspace/src/screen/error/no_connection_screen.dart';
import 'package:betterspace/src/screen/landing/network_aware.dart';
import 'package:betterspace/src/screen/menu/transaksi/process_detail_order.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/enums.dart';
import 'package:betterspace/src/view_model/login_viewmodel.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/view_model/office_viewmodels.dart';
import 'package:betterspace/src/view_model/transaction_viewmodels.dart';
import 'package:betterspace/src/widget/booking_widget/booking_button_widget.dart';
import 'package:betterspace/src/widget/booking_widget/booking_status_widget.dart';
import 'package:betterspace/src/widget/booking_widget/qr_checkin_widget.dart';
import 'package:betterspace/src/widget/office_card_widget/card_booking_history.dart';
import 'package:betterspace/src/widget/widget/card_shimmer_widget.dart';
import 'package:betterspace/src/widget/widget/default_appbar_widget.dart';
import 'package:betterspace/src/widget/widget/shimmer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingHistoryScreen extends StatefulWidget {
  final bool isCenterTitle;

  const BookingHistoryScreen({
    super.key,
    this.isCenterTitle = true,
  });

  @override
  State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
  @override
  void initState() {
    super.initState();
    final providerOfUser = Provider.of<LoginViewmodels>(context, listen: false);
    final providerOfOffice =
        Provider.of<OfficeViewModels>(context, listen: false);
    final providerOfTransaction =
        Provider.of<TransactionViewmodels>(context, listen: false);
    if (providerOfUser.userModels != null) {
      Future.delayed(Duration.zero, () async {
        providerOfTransaction.getTransactionByUser(
            userModels: providerOfUser.userModels!,
            ListOfAllOffice: providerOfOffice.listOfAllOfficeModels);
      });
    }
    widget.isCenterTitle;
  }

  @override
  Widget build(BuildContext context) {
    AdaptSize.size(context: context);
    return Scaffold(
      /// 13/12/22 mengganti appbar
      appBar: defaultAppbarWidget(
        contexts: context,
        leadIconFunction: () {
          context.read<NavigasiViewModel>().navigasiPop(context);
        },
        centerTitle: widget.isCenterTitle,
        isCenterTitle: widget.isCenterTitle,
        titles: 'Booking History',
      ),
      body: NetworkAware(
        offlineChild: const NoConnectionScreen(),
        onlineChild: Padding(
          padding: EdgeInsets.only(
            //top: AdaptSize.paddingTop + AdaptSize.screenHeight / 19,
            /// 13/12/22 ubah size padding
            left: AdaptSize.screenWidth * .016,
            right: AdaptSize.screenWidth * .016,
          ),
          child: SizedBox(
            height: AdaptSize.screenHeight,
            width: AdaptSize.screenWidth,
            child: Consumer<TransactionViewmodels>(
                builder: (context, value, child) {
              if (value.connectionState == stateOfConnections.isLoading) {
                return shimmerLoading(
                  child: commonShimmerLoadWidget(),
                );
              }
              if (value.connectionState == stateOfConnections.isReady) {
                return value.allTransaction.isNotEmpty
                    ? ListView.builder(
                        itemCount: value.allTransaction.length,
                        itemBuilder: ((context, index) {
                          final bookingData = value.allTransaction[index];
                          return cardBookingHistory(
                            context: context,
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      ProcessDetailOrderScreens(
                                    statusTransaction:
                                        BookingStatusWidget.statusOnProcess(
                                            context),
                                    requestedModels: bookingData,
                                    isNewTransaction: false,
                                  ),
                                ),
                              );
                            },
                            cardOfficeImage: bookingData
                                    .officeData?.officeLeadImage ??
                                "assets/image_assets/space_image/space1.png",
                            bookingId: bookingData.bookingId.toString(),
                            statusBooking: bookingData.Status == "on process"
                                ? BookingStatusWidget.statusOnProcess(context)
                                : bookingData.Status == "rejected"
                                    ? BookingStatusWidget.statusCancelled(
                                        context)
                                    : BookingStatusWidget.statusSuccess(
                                        context),
                            officeName: bookingData.officeData?.officeName ??
                                "placeholder",
                            officeType: bookingData.officeData?.officeType ??
                                "placeholder",
                            dateCheckIn: bookingData.bookingTime.checkInDate,
                            hoursCheckIn: bookingData.bookingTime.checkInHour,
                            buttonStatus: bookingData.Status == "accepted"
                                ? BookingButtonWidget.avaliableButton(
                                    context: context,
                                    buttonText: "Check in now",
                                    paddingTop: AdaptSize.pixel8,
                                    paddingBottom: AdaptSize.pixel8,
                                    onPressed: () {
                                      qrCodeCheckIn(
                                          context: context,
                                          title: 'QR Code',
                                          description:
                                              'Show the QR Code to the staff',
                                          qrCodeData:
                                              'bookingId:${bookingData.bookingId}, paymentMethod:${bookingData.paymentMethod.paymentId}, bookingCheckInDate${bookingData.bookingTime.checkInDate}, userId:${bookingData.userData.userId} email:${bookingData.userData.userEmail}');
                                      debugPrint(
                                          'bookingId:${bookingData.bookingId}, paymentMethod:${bookingData.paymentMethod.paymentId}, bookingCheckInDate${bookingData.bookingTime.checkInDate}, userId:${bookingData.userData.userId} email:${bookingData.userData.userEmail}');
                                    })
                                : BookingButtonWidget.disableButton(
                                    context: context,
                                    paddingBottom: AdaptSize.pixel8),
                          );
                        }),
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/image_assets/register_success_dialog.png',
                              height: AdaptSize.screenWidth / 1000 * 500,
                              width: AdaptSize.screenWidth / 1000 * 500,
                              scale: .8,
                            ),
                            Text(
                              'Order history is not yet available',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: AdaptSize.pixel14),
                            ),
                          ],
                        ),
                      );
              }
              if (value.connectionState == stateOfConnections.isFailed) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/image_assets/register_success_dialog.png',
                        height: AdaptSize.screenWidth / 1000 * 500,
                        width: AdaptSize.screenWidth / 1000 * 500,
                        scale: .8,
                      ),
                      Text(
                        'Order history is not yet available',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: AdaptSize.pixel14),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox();
            }),
          ),
        ),
      ),
    );
  }
}
