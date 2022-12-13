import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/view_model/search_spaces_view_model.dart';
import 'package:betterspace/src/widget/home_widget/office_detail_widget/payment_metod_screen.dart';
import 'package:betterspace/src/widget/widget/bottom_card.dart';
import 'package:betterspace/src/widget/widget/custom_radio_button.dart';
import 'package:betterspace/src/widget/widget/default_appbar_widget.dart';
import 'package:betterspace/src/widget/widget/horizontal_month_picker.dart';
import 'package:betterspace/src/widget/widget/horizontal_timepicker.dart';
import 'package:betterspace/src/widget/widget/offiice_item_cards.dart';
import 'package:betterspace/src/widget/widget/read_only_form.dart';
import 'package:betterspace/src/widget/widget/text_filed_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    discountFormController.dispose();
    _dateController.dispose();
  }

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
                    bottom: AdaptSize.pixel16,
                    top: AdaptSize.pixel24,
                  ),
                  child: SizedBox(
                    width: AdaptSize.screenWidth / 1.097561,
                    height: AdaptSize.pixel40,
                    child: ElevatedButton(
                      onPressed: () {
                        /// blm dipindah
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    const PaymentMetodScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: MyColor.neutral600),
                      child: Text(
                        "Checkin Now",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: MyColor.neutral700),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: AdaptSize.screenWidth / 1.097561,
                  height: AdaptSize.pixel40,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColor.neutral900,
                      shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        side: BorderSide(
                            color: MyColor.secondary400,
                            width: AdaptSize.pixel2),
                      ),
                    ),
                    child: Text(
                      "Booking Historys",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: MyColor.secondary400),
                    ),
                  ),
                ),
                SizedBox(
                  height: AdaptSize.screenHeight * .012,
                ),
              ],
            ),
            cardBottomPadding: 0,
            cardTopLeftRadius: 8,
            cardTopRightRadius: 8),
      ),
      /// 13/12/22 mengganti app bar
      appBar: defaultAppbarWidget(
          contexts: context,
          leadIconFunction: () {
            context.read<NavigasiViewModel>().navigasiPop(context);
          },
          isCenterTitle: false,
          titles: 'Checkout'),
      body: Padding(
        padding: const EdgeInsets.only(),
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
                      child: readOnlyWidget(
                        controller: _dateController,
                        enblBorderRadius: 16,
                        errBorderRadius: 16,
                        fcsBorderRadius: 16,
                        hint: 'day, date month year',
                        textStyle:
                            Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: MyColor.grayLightColor,
                                ),
                        onTap: () {
                          pickedDate(context);
                        },
                        suffixIcon: Icon(
                          CupertinoIcons.calendar,
                          color: MyColor.grayLightColor,
                        ),
                      ),
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
                          physics: const NeverScrollableScrollPhysics(),
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
                                        child: const Image(
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
                                            "Hot Chocolate ${selectedBeverageId.value}",
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
                                          const Spacer(),
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
                          prefixIcons: const Icon(Icons.percent_outlined),
                          suffixIcon: const Icon(Icons.percent),
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

  Future pickedDate(BuildContext context) async {
    final dateProvider =
        Provider.of<SearchSpacesViewModel>(context, listen: false);

    dateProvider.dateNow = (await showDatePicker(
      context: context,
      initialDate: dateProvider.dateTime,
      firstDate: DateTime(1999),
      lastDate: DateTime(2050),
      fieldLabelText: 'Booking Date',
      fieldHintText: 'Month/Date/Year',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: MyColor.darkBlueColor,
              surface: MyColor.whiteColor,
              onPrimary: MyColor.whiteColor,
              onSurface: MyColor.darkColor,
            ),
            dialogTheme: DialogTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: MyColor.darkBlueColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    ))!;

    dateProvider.pickdate();
    _dateController.text = dateProvider.datePicked;
  }
}
