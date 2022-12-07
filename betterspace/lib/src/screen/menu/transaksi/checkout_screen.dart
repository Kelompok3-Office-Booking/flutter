import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/widget/widget/bottom_card.dart';
import 'package:betterspace/src/widget/widget/default_appbar_widget.dart';
import 'package:betterspace/src/widget/widget/horizontal_month_picker.dart';
import 'package:betterspace/src/widget/widget/horizontal_timepicker.dart';
import 'package:betterspace/src/widget/widget/offiice_item_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  ValueNotifier<int> selectedHour = ValueNotifier<int>(8);
  ValueNotifier<int> selectedMonth = ValueNotifier<int>(1);
  @override
  Widget build(BuildContext context) {
    AdaptSize.size(context: context);
    return Scaffold(
      appBar: defaultAppbarWidget(
          contexts: context, titles: "Checkout", leadIconFunction: () {}),
      body: Padding(
        padding: EdgeInsets.only(),
        child: SizedBox(
          width: AdaptSize.screenWidth,
          height: AdaptSize.screenHeight,
          child: Column(
            children: [
              Flexible(
                fit: FlexFit.loose,
                flex: 12,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: AdaptSize.pixel8,
                      right: AdaptSize.pixel16,
                      left: AdaptSize.pixel16),
                  child: SizedBox(
                    width: AdaptSize.screenWidth / 1.097561,
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: AdaptSize.pixel24,
                              bottom: AdaptSize.pixel24),
                          child: officeItemCards(contexts: context),
                        ),
                        SizedBox(
                          height: AdaptSize.screenWidth / 1.40625,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Status",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: MyColor.neutral100,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            AdaptSize.screenHeight / 1000 * 18),
                              ),
                              SizedBox(
                                height: AdaptSize.screenWidth / 6.42857142,
                              ),
                              Text(
                                "Select Time To Checkin",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: MyColor.neutral100,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            AdaptSize.screenHeight / 1000 * 18),
                              ),
                              SizedBox(
                                height: AdaptSize.pixel26,
                                child: horizontalTimePicker(
                                    contexts: context,
                                    isSelected: selectedHour),
                              ),
                              Text(
                                "For How Long?",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: MyColor.neutral100,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            AdaptSize.screenHeight / 1000 * 18),
                              ),
                              SizedBox(
                                height: AdaptSize.pixel26,
                                child: horizontalMonthPicker(
                                    contexts: context,
                                    isSelected: selectedMonth),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                flex: 4,
                child: SizedBox(
                  width: AdaptSize.screenWidth,
                  child: partialRoundedCard(
                      childWidgets: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: AdaptSize.pixel16,
                                top: AdaptSize.pixel24),
                            child: SizedBox(
                              width: AdaptSize.screenWidth / 1.097561,
                              height: AdaptSize.pixel40,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Checkin Now",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: MyColor.neutral700),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: MyColor.neutral600),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: AdaptSize.screenWidth / 1.097561,
                            height: AdaptSize.pixel40,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Booking Historys",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: MyColor.secondary400),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyColor.neutral900,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  side: BorderSide(
                                      color: MyColor.secondary400,
                                      width: AdaptSize.pixel2),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      cardBottomPadding: 0,
                      cardTopLeftRadius: 8,
                      cardTopRightRadius: 8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
