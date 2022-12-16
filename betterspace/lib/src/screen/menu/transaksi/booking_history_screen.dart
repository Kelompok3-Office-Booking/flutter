import 'package:betterspace/src/screen/menu/transaksi/detail_order/process_detail_order.dart';
import 'package:betterspace/src/screen/menu/transaksi/detail_order/success_detail_order.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/widget/booking_widget/booking_button_widget.dart';
import 'package:betterspace/src/widget/booking_widget/booking_status_widget.dart';
import 'package:betterspace/src/widget/booking_widget/info_onprocessed_widget.dart';
import 'package:betterspace/src/widget/booking_widget/qr_checkin_widget.dart';
import 'package:betterspace/src/widget/office_card_widget/card_booking_history.dart';
import 'package:betterspace/src/widget/widget/default_appbar_widget.dart';
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
      body: Padding(
        padding: EdgeInsets.only(
          //top: AdaptSize.paddingTop + AdaptSize.screenHeight / 19,
          /// 13/12/22 ubah size padding
          left: AdaptSize.screenWidth * .016,
          right: AdaptSize.screenWidth * .016,
        ),
        child: SizedBox(
          height: AdaptSize.screenHeight,
          width: AdaptSize.screenWidth,
          child: ListView(
            children: [
              /// sample booking success
              cardBookingHistory(
                context: context,
                onTap: () {
                  context.read<NavigasiViewModel>().navigasiAllOffice(
                        context,
                        const SuccessDetailOrderScreens(),
                      );
                },
                bookingId: 'ID07XCFF6',
                statusBooking: BookingStatusWidget.statusSuccess(context),
                officeName: 'Location xxxxx',
                officeType: 'coworking space',
                dateCheckIn: 'Friday, 18 Nov 2022',
                hoursCheckIn: '18.00 : 22.00',
                buttonStatus: BookingButtonWidget.avaliableButton(
                  context: context,
                  onPressed: () {
                    qrCodeCheckIn(
                        context: context,
                        title: 'QR Code',
                        description: 'Show the QR Code to the staff');
                  },
                  buttonText: 'Check-in Now',
                  paddingTop: AdaptSize.pixel16,
                  paddingBottom: AdaptSize.pixel8,
                ),
              ),

              /// sample booking on process
              cardBookingHistory(
                context: context,
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => ProcessDetailOrderScreens(
                        statusTransaction:
                            BookingStatusWidget.statusOnProcess(context),
                        infoOnProcessed: infoOnProcess(context),
                      ),
                    ),
                  );
                },
                bookingId: 'ID07XCFF6',
                statusBooking: BookingStatusWidget.statusOnProcess(context),
                officeName: 'Location xxxxx',
                officeType: 'meeting room',
                dateCheckIn: 'Friday, 23 Nov 2022',
                hoursCheckIn: '12.00 : 20.00',
                buttonStatus: BookingButtonWidget.disableButton(
                    context: context, paddingBottom: AdaptSize.pixel8),
              ),

              /// sample booking cancelled
              cardBookingHistory(
                context: context,
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => ProcessDetailOrderScreens(
                        statusTransaction:
                            BookingStatusWidget.statusCancelled(context),
                      ),
                    ),
                  );
                },
                bookingId: 'ID07XCFF6',
                statusBooking: BookingStatusWidget.statusCancelled(context),
                officeName: 'Location xxxxx',
                officeType: 'office',
                dateCheckIn: 'Friday, 18 Nov 2022',
                hoursCheckIn: '18.00 : 22.00',
                buttonStatus: BookingButtonWidget.disableButton(
                    context: context, paddingBottom: AdaptSize.pixel8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
