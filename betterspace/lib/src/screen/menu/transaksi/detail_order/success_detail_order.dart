import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/widget/booking_widget/booking_button_widget.dart';
import 'package:betterspace/src/widget/booking_widget/booking_status_widget.dart';
import 'package:betterspace/src/widget/booking_widget/qr_checkin_widget.dart';
import 'package:betterspace/src/widget/office_card_widget/detail_order_card.dart';
import 'package:betterspace/src/widget/widget/bottom_card.dart';
import 'package:betterspace/src/widget/widget/default_appbar_widget.dart';
import 'package:betterspace/src/widget/widget/divider_widget.dart';
import 'package:betterspace/src/widget/widget/icon_with_label.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SuccessDetailOrderScreens extends StatefulWidget {
  const SuccessDetailOrderScreens({super.key});

  @override
  State<SuccessDetailOrderScreens> createState() => _SuccessDetailOrderScreensState();
}

class _SuccessDetailOrderScreensState extends State<SuccessDetailOrderScreens> {
  @override
  Widget build(BuildContext context) {
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
      body: Column(
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
                        BookingStatusWidget.statusSuccess(context)
                      ],
                    ),
                  ),

                  /// card detail order
                  detailOrderCard(
                    context: context,
                    officeImage:
                        'https://cdn1-production-images-kly.akamaized.net/sBbpp2jnXav0YR8a_VVFjMtCCJQ=/1200x1200/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/882764/original/054263300_1432281574-Boruto-Naruto-the-Movie-trailer.jpg',
                    officeName: 'Sample Office',
                    officeLocation: 'Johar Selatan',
                    officeApproxDistance: '10',
                    officePersonCapacity: '100',
                    officeArea: '200',
                    officeType: 'coworking space',
                  ),

                  SizedBox(
                    height: AdaptSize.screenHeight * .016,
                  ),

                  Text(
                    "Reservation Detail",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: MyColor.neutral100, fontSize: AdaptSize.pixel16),
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
                              labelText: "Fadli Rahmadan",
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
                              labelText: "Sunday, 21 February 2022",
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
                              labelText: "09:00",
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
                              labelText: "Iced Lemon Tea",
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
                    padding:
                        EdgeInsets.only(bottom: AdaptSize.screenHeight * .016),
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
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: MyColor.neutral100,
                                    fontSize: AdaptSize.pixel14,
                                  ),
                        ),
                        const Spacer(),
                        Text(
                          "/placeholder/",
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
                                  locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                              .format(2343090),
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
                                  locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                              .format(35000),
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
                          "x6 Hour",
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
                                  locale: 'id', symbol: 'Rp ', decimalDigits: 0)
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
                                  locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                              .format(5000000),
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
                    padding:
                        EdgeInsets.only(bottom: AdaptSize.screenHeight * .016),
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
                                  locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                              .format(23090),
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
              childWidgets: Column(
                children: [
                  BookingButtonWidget.checkinDetailOrderButton(
                    context: context,
                    onPressed: () {
                      qrCodeCheckIn(
                          context: context,
                          title: 'QR Code',
                          description: 'Show the QR Code to the staff');
                    },
                    buttonText: 'Check-in Now',
                    paddingTop: AdaptSize.pixel14,
                    paddingBottom: AdaptSize.screenHeight * .014,
                  ),
                  BookingButtonWidget.avaliableButton(
                      context: context,
                      onPressed: () {},
                      paddingTop: 0,
                      paddingBottom: AdaptSize.pixel14,
                      buttonText: 'Add Review'),
                ],
              ),
              cardBottomPadding: 0,
              cardTopLeftRadius: 8,
              cardTopRightRadius: 8),
        ],
      ),
    );
  }
}
