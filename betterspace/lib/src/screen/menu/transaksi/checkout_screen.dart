import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/widget/widget/bottom_card.dart';
import 'package:betterspace/src/widget/widget/custom_radio_button.dart';
import 'package:betterspace/src/widget/widget/default_appbar_widget.dart';
import 'package:betterspace/src/widget/widget/horizontal_month_picker.dart';
import 'package:betterspace/src/widget/widget/horizontal_timepicker.dart';
import 'package:betterspace/src/widget/widget/offiice_item_cards.dart';
import 'package:betterspace/src/widget/widget/text_filed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  ValueNotifier<int> selectedBeverageId = ValueNotifier<int>(1);
  TextEditingController discountFormController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AdaptSize.size(context: context);
    return Scaffold(
      bottomNavigationBar: SizedBox(
        width: AdaptSize.screenWidth,
        child: partialRoundedCard(
            childWidgets: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: AdaptSize.pixel16, top: AdaptSize.pixel24),
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
      appBar: defaultAppbarWidget(
          contexts: context, titles: "Checkout", leadIconFunction: () {}),
      body: Padding(
        padding: EdgeInsets.only(),
        child: SizedBox(
          width: AdaptSize.screenWidth,
          height: AdaptSize.screenHeight,
          child: Padding(
            padding: EdgeInsets.only(
                right: AdaptSize.pixel16, left: AdaptSize.pixel16),
            child: SizedBox(
              width: AdaptSize.screenWidth / 1.097561,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: AdaptSize.pixel16),
                    child: officeItemCards(contexts: context),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: AdaptSize.pixel16),
                    child: SizedBox(
                      height: AdaptSize.pixel22,
                      child: Text(
                        "When You Come?",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: MyColor.neutral100,
                            fontWeight: FontWeight.bold,
                            fontSize: AdaptSize.screenHeight / 1000 * 18),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: AdaptSize.pixel16),
                    child: SizedBox(
                      height: AdaptSize.screenWidth / 6.42857142,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: AdaptSize.pixel16),
                    child: SizedBox(
                      height: AdaptSize.pixel22,
                      child: Text(
                        "Select Time To Checkin",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: MyColor.neutral100,
                            fontWeight: FontWeight.bold,
                            fontSize: AdaptSize.screenHeight / 1000 * 18),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: AdaptSize.pixel16),
                    child: SizedBox(
                      height: AdaptSize.pixel26,
                      child: horizontalTimePicker(
                          contexts: context, isSelected: selectedHour),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: AdaptSize.pixel16),
                    child: Text(
                      "For How Long?",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: MyColor.neutral100,
                          fontWeight: FontWeight.bold,
                          fontSize: AdaptSize.screenHeight / 1000 * 18),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: AdaptSize.pixel16),
                    child: SizedBox(
                      height: AdaptSize.pixel26,
                      child: horizontalMonthPicker(
                          contexts: context, isSelected: selectedMonth),
                    ),
                  ),
                  SizedBox(
                    width: AdaptSize.screenWidth,
                    height: AdaptSize.pixel4,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: MyColor.neutral800),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: AdaptSize.pixel16),
                    child: SizedBox(
                      width: AdaptSize.screenWidth / 1.097561,
                      child: Text(
                        "Select Free Welcome Drink",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: MyColor.neutral100,
                            fontWeight: FontWeight.bold,
                            fontSize: AdaptSize.screenHeight / 1000 * 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: AdaptSize.screenWidth / 1.097561,
                    height: AdaptSize.screenWidth / 1.73076923,
                    child: ValueListenableBuilder(
                      valueListenable: selectedBeverageId,
                      builder: ((context, value, child) {
                        return ListView.builder(
                          itemCount: 3,
                          itemBuilder: ((context, index) {
                            int controlledIndex = index + 1;
                            return Padding(
                              padding:
                                  EdgeInsets.only(bottom: AdaptSize.pixel16),
                              child: SizedBox(
                                width: AdaptSize.screenWidth / 1.097561,
                                height: AdaptSize.screenWidth / 6.428571428,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: AdaptSize.pixel16),
                                      child: SizedBox(
                                        width:
                                            AdaptSize.screenWidth / 6.428571428,
                                        height:
                                            AdaptSize.screenWidth / 6.428571428,
                                        child: Image(
                                          image: AssetImage(
                                              "assets/image_assets/beverages_image/beverage1.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: AdaptSize.screenWidth / 1.875,
                                      height:
                                          AdaptSize.screenWidth / 6.428571428,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Hot Chocolate " +
                                                selectedBeverageId.value
                                                    .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color: MyColor.neutral100,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        AdaptSize.screenHeight /
                                                            1000 *
                                                            16),
                                          ),
                                          Spacer(),
                                          Text(
                                            "Hot chocolate can warm the body from cold air",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color: MyColor.neutral100,
                                                    fontSize:
                                                        AdaptSize.screenHeight /
                                                            1000 *
                                                            16),
                                          ),
                                        ],
                                      ),
                                    ),
                                    customRadioButton(
                                        context: context,
                                        customRadioController:
                                            selectedBeverageId,
                                        controlledIdValue: controlledIndex),
                                  ],
                                ),
                              ),
                            );
                          }),
                        );
                      }),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: AdaptSize.pixel16),
                    child: SizedBox(
                      height: AdaptSize.screenWidth / 6.4285714,
                      child: textFormFields(
                          label: "discount code",
                          hintTexts: "AXRRR#2",
                          controller: discountFormController),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
