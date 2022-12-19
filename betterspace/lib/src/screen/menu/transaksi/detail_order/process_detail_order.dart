import 'package:betterspace/src/dummy_data/transaction_data/transaction_models.dart';
import 'package:betterspace/src/model/transaction_model/transaction_models.dart';
import 'package:betterspace/src/screen/error/no_connection_screen.dart';
import 'package:betterspace/src/screen/landing/network_aware.dart';
import 'package:betterspace/src/services/parsers.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/utils/enums.dart';
import 'package:betterspace/src/view_model/login_viewmodel.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/view_model/office_viewmodels.dart';
import 'package:betterspace/src/view_model/transaction_viewmodels.dart';
import 'package:betterspace/src/widget/booking_widget/booking_button_widget.dart';
import 'package:betterspace/src/widget/booking_widget/booking_status_widget.dart';
import 'package:betterspace/src/widget/office_card_widget/detail_order_card.dart';
import 'package:betterspace/src/widget/widget/bottom_card.dart';
import 'package:betterspace/src/widget/widget/default_appbar_widget.dart';
import 'package:betterspace/src/widget/widget/divider_widget.dart';
import 'package:betterspace/src/widget/widget/icon_with_label.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProcessDetailOrderScreens extends StatefulWidget {
  final Widget statusTransaction;
  final Widget? infoOnProcessed;
  final bool isNewTransaction;
  final UserTransaction? requestedModels;
  final CreateTransactionModels? requestedCreateTransactionModel;

  const ProcessDetailOrderScreens({
    super.key,
    required this.isNewTransaction,
    required this.statusTransaction,
    this.requestedModels,
    this.requestedCreateTransactionModel,
    this.infoOnProcessed,
  });

  @override
  State<ProcessDetailOrderScreens> createState() =>
      _ProcessDetailOrderScreensState();
}

class _ProcessDetailOrderScreensState extends State<ProcessDetailOrderScreens> {
  @override
  void initState() {
    super.initState();
    final providerOfUser = Provider.of<LoginViewmodels>(context, listen: false);
    final providerOfOffice =
        Provider.of<OfficeViewModels>(context, listen: false);
    if (providerOfUser.userModels == null) {
      providerOfUser.getProfile();
    }
    if (providerOfOffice.listOfAllOfficeModels.length == 0) {
      providerOfOffice.fetchAllOffice();
    }

    widget.statusTransaction;
    widget.infoOnProcessed;
  }

  @override
  Widget build(BuildContext context) {
    final providerOfUser = Provider.of<LoginViewmodels>(context, listen: false);

    UserTransaction? bookingData = widget.requestedModels ??
        parseCreateTransactionToUserTransaction(
            requestedModel: widget.requestedCreateTransactionModel,
            usedUserModel: providerOfUser.userModels!);

    final providerOfOffices =
        Provider.of<OfficeViewModels>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: true,

      /// mengganti appbar
      appBar: defaultAppbarWidget(
        contexts: context,
        leadIconFunction: () {
          context.read<NavigasiViewModel>().navigasiPop(context);
        },
        isCenterTitle: false,
        titles: 'Detail Order',
      ),
      body: NetworkAware(
        offlineChild: const NoConnectionScreen(),
        onlineChild: Column(
          children: [
            Flexible(
              fit: FlexFit.loose,
              flex: 12,
              child: Padding(
                padding: EdgeInsets.only(
                  top: AdaptSize.pixel8,
                  right: AdaptSize.screenWidth * .016,
                  left: AdaptSize.screenWidth * .016,
                ),
                child: ListView(
                  children: [
                    /// info widget
                    widget.infoOnProcessed ?? const SizedBox(),

                    Padding(
                      padding: EdgeInsets.only(
                          top: AdaptSize.pixel8, bottom: AdaptSize.pixel16),
                      child: Row(
                        children: [
                          Text(
                            "Status",
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: MyColor.neutral100,
                                      fontSize: AdaptSize.pixel16,
                                    ),
                          ),
                          const Spacer(),

                          /// status order widget
                          bookingData != null
                              ? bookingData.Status == "on process"
                                  ? BookingStatusWidget.statusOnProcess(context)
                                  : bookingData.Status == "rejected"
                                      ? BookingStatusWidget.statusCancelled(
                                          context)
                                      : BookingStatusWidget.statusSuccess(
                                          context)
                              : BookingStatusWidget.statusOnProcess(context),
                        ],
                      ),
                    ),

                    /// card detail order
                    detailOrderCard(
                      context: context,
                      officeImage: bookingData?.officeData?.officeLeadImage !=
                              null
                          ? bookingData!.officeData!.officeLeadImage
                          : 'https://cdn1-production-images-kly.akamaized.net/sBbpp2jnXav0YR8a_VVFjMtCCJQ=/1200x1200/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/882764/original/054263300_1432281574-Boruto-Naruto-the-Movie-trailer.jpg',
                      officeName:
                          bookingData?.officeData?.officeName ?? "placeholder",
                      officeLocation:
                          bookingData?.officeData?.officeName ?? "placeholder",
                      officeApproxDistance:
                          (bookingData?.officeData?.officeApproxDistance)
                              .toString(),
                      officePersonCapacity: bookingData?.officeData != null
                          ? bookingData!.officeData!.officePersonCapacity
                              .toString()
                          : "999",
                      officeArea: bookingData?.officeData != null
                          ? bookingData!.officeData!.officeArea.toString()
                          : "999",
                      officeType: bookingData?.officeData?.officeType ??
                          'coworking space',
                    ),

                    SizedBox(
                      height: AdaptSize.screenHeight * .016,
                    ),

                    Text(
                      "Reservation Detail",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: MyColor.neutral100,
                          fontSize: AdaptSize.pixel16),
                    ),

                    SizedBox(
                      height: AdaptSize.screenHeight * .016,
                    ),

                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: AdaptSize.screenHeight * .01),
                              child: IconWithLabel().asrow(
                                iconColor: MyColor.secondary400,
                                spacer: AdaptSize.screenHeight * .016,
                                contexts: context,
                                usedIcon: Icons.account_circle_outlined,
                                labelText: bookingData != null
                                    ? bookingData
                                        .userData.userProfileDetails.userName
                                    : "Fadli Rahmadan",
                                iconSize: AdaptSize.pixel24,
                                fontSizes: AdaptSize.pixel14,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: AdaptSize.screenHeight * .01),
                              child: IconWithLabel().asrow(
                                iconColor: MyColor.secondary400,
                                spacer: AdaptSize.screenHeight * .016,
                                contexts: context,
                                usedIcon: Icons.calendar_month_outlined,
                                labelText: bookingData != null
                                    ? widget.isNewTransaction == false
                                        ? DateFormat('EEEE, d MMMM yyyy')
                                            .format(parseApiFormatDateTime(
                                                apiFormattedDateTime:
                                                    bookingData.bookingTime
                                                        .checkInDate)!)
                                        : DateFormat('EEEE, d MMMM yyyy')
                                            .format(parseApiFormatDateTime2(
                                                apiFormattedDateTime:
                                                    bookingData.bookingTime
                                                        .checkInDate)!)
                                    : "placeholder",
                                iconSize: AdaptSize.pixel24,
                                fontSizes: AdaptSize.pixel14,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: AdaptSize.screenHeight * .01),
                              child: IconWithLabel().asrow(
                                iconColor: MyColor.secondary400,
                                spacer: AdaptSize.screenHeight * .016,
                                contexts: context,
                                usedIcon: Icons.access_time_outlined,
                                labelText:
                                    bookingData?.bookingTime.checkInHour ??
                                        "placeholder",
                                iconSize: AdaptSize.pixel24,
                                fontSizes: AdaptSize.pixel14,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: AdaptSize.screenHeight * .01),
                              child: IconWithLabel().asrow(
                                iconColor: MyColor.secondary400,
                                spacer: AdaptSize.screenHeight * .016,
                                contexts: context,
                                usedIcon: Icons.emoji_food_beverage_outlined,
                                labelText: bookingData?.Drink ?? "placeholder",
                                iconSize: AdaptSize.pixel24,
                                fontSizes: AdaptSize.pixel14,
                              ),
                            ),
                          ],
                        );
                      },
                    ),

                    /// garis bawah
                    dividerWdiget(width: double.infinity, opacity: .1),

                    Padding(
                      padding: EdgeInsets.only(
                          bottom: AdaptSize.screenHeight * .016),
                      child: Text(
                        "Reservation Detail",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: MyColor.neutral100,
                            fontSize: AdaptSize.pixel16),
                      ),
                    ),

                    /// payment method
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: AdaptSize.screenHeight * .01),
                      child: Row(
                        children: [
                          Text(
                            "Payment Method",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: MyColor.neutral100,
                                  fontSize: AdaptSize.pixel14,
                                ),
                          ),
                          const Spacer(),
                          Text(
                            bookingData?.paymentMethod.paymentMethodName ??
                                "placeholder",
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: MyColor.neutral100,
                                      fontSize: AdaptSize.pixel14,
                                    ),
                          ),
                        ],
                      ),
                    ),

                    /// total price
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: AdaptSize.screenHeight * .01),
                      child: Row(
                        children: [
                          Text(
                            "Total Price",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: MyColor.neutral100,
                                    fontSize: AdaptSize.pixel14),
                          ),
                          const Spacer(),
                          Text(
                            NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 0)
                                .format(bookingData?.bookingOfficePrice ??
                                    999999999),
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: MyColor.neutral100,
                                      fontSize: AdaptSize.pixel14,
                                    ),
                          ),
                        ],
                      ),
                    ),

                    /// price hour text
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: AdaptSize.screenHeight * .01),
                      child: Row(
                        children: [
                          Text(
                            "Price/Hour",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: MyColor.neutral100,
                                    fontSize: AdaptSize.pixel14),
                          ),
                          const Spacer(),
                          Text(
                            NumberFormat.currency(
                                        locale: 'id',
                                        symbol: 'Rp ',
                                        decimalDigits: 0)
                                    .format(bookingData?.officeData
                                            ?.officePricing.officePrice ??
                                        35000) +
                                (bookingData?.officeData?.officeType == "Office"
                                    ? " /month"
                                    : " /hour"),
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: MyColor.neutral100,
                                      fontSize: AdaptSize.pixel14,
                                    ),
                          ),
                        ],
                      ),
                    ),

                    /// duration text
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: AdaptSize.screenHeight * .01),
                      child: Row(
                        children: [
                          Text(
                            "Duration",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: MyColor.neutral100,
                                    fontSize: AdaptSize.pixel14),
                          ),
                          const Spacer(),
                          Text(
                            (((bookingData?.bookingOfficePrice ?? 90) /
                                            (bookingData
                                                    ?.officeData
                                                    ?.officePricing
                                                    .officePrice ??
                                                4))
                                        .round())
                                    .toString() +
                                (bookingData?.officeData?.officeType == "Office"
                                    ? " month"
                                    : " hour"),
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    color: MyColor.neutral100,
                                    fontSize: AdaptSize.pixel14),
                          ),
                        ],
                      ),
                    ),

                    /// service text
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: AdaptSize.screenHeight * .01),
                      child: Row(
                        children: [
                          Text(
                            "Service",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: MyColor.neutral100,
                                    fontSize: AdaptSize.pixel14),
                          ),
                          const Spacer(),
                          Text(
                            NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 0)
                                .format(10000),
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: MyColor.neutral100,
                                      fontSize: AdaptSize.pixel14,
                                    ),
                          ),
                        ],
                      ),
                    ),

                    dividerWdiget(width: double.infinity, opacity: .1),

                    /// total text
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: AdaptSize.screenHeight * .01),
                      child: Row(
                        children: [
                          Text(
                            "Total",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: MyColor.neutral100,
                                    fontSize: AdaptSize.pixel14),
                          ),
                          const Spacer(),
                          Text(
                            NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 0)
                                .format(
                                    ((((bookingData?.bookingOfficePrice ?? 90) /
                                                    (bookingData
                                                            ?.officeData
                                                            ?.officePricing
                                                            .officePrice ??
                                                        4)) *
                                                (bookingData
                                                        ?.officeData
                                                        ?.officePricing
                                                        .officePrice ??
                                                    2)) +
                                            10000)
                                        .round()),
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: MyColor.neutral100,
                                      fontSize: AdaptSize.pixel14,
                                    ),
                          ),
                        ],
                      ),
                    ),

                    /// ppn
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: AdaptSize.screenHeight * .016),
                      child: Row(
                        children: [
                          Text(
                            "PPN(11%)",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: MyColor.neutral100,
                                    fontSize: AdaptSize.pixel14),
                          ),
                          const Spacer(),
                          Text(
                            NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 0)
                                .format(((((((bookingData?.bookingOfficePrice ??
                                                            90) /
                                                        (bookingData
                                                                ?.officeData
                                                                ?.officePricing
                                                                .officePrice ??
                                                            4)) *
                                                    (bookingData
                                                            ?.officeData
                                                            ?.officePricing
                                                            .officePrice ??
                                                        2)) +
                                                10000)
                                            .round()) /
                                        100) *
                                    11),
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: MyColor.neutral100,
                                      fontSize: AdaptSize.pixel14,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// footer
            partialRoundedCard(
                childWidgets: BookingButtonWidget.disableButton(
                  context: context,
                  paddingBottom: AdaptSize.pixel16,
                ),
                cardBottomPadding: 0,
                cardTopLeftRadius: 8,
                cardTopRightRadius: 8),
          ],
        ),
      ),
    );
  }
}
