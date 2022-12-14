import 'dart:math';
import 'package:betterspace/src/model/office_models/office_dummy_data.dart';
import 'package:betterspace/src/model/office_models/office_dummy_models.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/view_model/search_spaces_view_model.dart';
import 'package:betterspace/src/widget/widget/bottom_card.dart';
import 'package:betterspace/src/widget/widget/button_widget.dart';
import 'package:betterspace/src/widget/widget/card_shimmer_widget.dart';
import 'package:betterspace/src/widget/widget/custom_radio_button.dart';
import 'package:betterspace/src/widget/widget/default_appbar_widget.dart';
import 'package:betterspace/src/widget/widget/horizontal_month_picker.dart';
import 'package:betterspace/src/widget/widget/horizontal_timepicker.dart';
import 'package:betterspace/src/widget/office_card_widget/office_type_card.dart';
import 'package:betterspace/src/widget/widget/read_only_form.dart';
import 'package:betterspace/src/widget/widget/shimmer_widget.dart';
import 'package:betterspace/src/widget/widget/text_filed_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  final int officeId;

  const CheckoutScreen({super.key, required this.officeId});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  ValueNotifier<int> selectedHour = ValueNotifier<int>(8);
  ValueNotifier<int> selectedMonth = ValueNotifier<int>(1);
  ValueNotifier<int> selectedBeverageId = ValueNotifier<int>(1);
  TextEditingController discountFormController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    discountFormController.dispose();
    _dateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dummyDataProviders =
        Provider.of<OfficeDummyDataViewModels>(context, listen: false);
    List<OfficeModels> listOfDummyOffice =
        dummyDataProviders.listOfOfficeModels;
    return Scaffold(
      bottomNavigationBar: SizedBox(
        width: AdaptSize.screenWidth,
        child: partialRoundedCard(
            childWidgets: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// update 13 11 22 menyamakan dengan detail screen
                Padding(
                  padding: EdgeInsets.only(
                    top: AdaptSize.pixel16,
                    left: AdaptSize.pixel16,
                    right: AdaptSize.pixel16,
                    bottom: AdaptSize.pixel6,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Start From',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: MyColor.darkBlueColor,
                                      fontSize: AdaptSize.pixel16,
                                    ),
                          ),
                          Text(
                            NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 0)
                                .format(Random().nextDouble() * 400000),
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: MyColor.darkBlueColor,
                                      fontSize: AdaptSize.pixel14,
                                    ),
                          ),
                        ],
                      ),
                      buttonWidget(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<NavigasiViewModel>()
                                .navigasiToPaymentMetod(
                                  context,
                                  widget.officeId,
                                );
                          }
                        },
                        borderRadius: BorderRadius.circular(8),
                        backgroundColor: MyColor.secondary400,
                        foregroundColor: MyColor.secondary400,
                        child: Text(
                          'Book Now',
                          style: Theme.of(context).textTheme.button!.copyWith(
                                fontSize: AdaptSize.pixel14,
                                color: MyColor.neutral900,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AdaptSize.screenHeight * .012,
                ),
              ],
            ),
            cardBottomPadding: 0,
            cardTopLeftRadius: 16,
            cardTopRightRadius: 16),
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
        /// update 13 12 22 menghapus widget yang bertumpukan
        padding: EdgeInsets.only(
          top: AdaptSize.screenHeight * .016,
          right: AdaptSize.screenWidth * .016,

          /// update 13 12 22 mengubah ukuran padding
          left: AdaptSize.screenWidth * .016,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              /// update 13 12 22 meenyesuaikan card overflow
              Padding(
                padding: EdgeInsets.only(bottom: AdaptSize.pixel16),
                child: CachedNetworkImage(
                  imageUrl: listOfDummyOffice[widget.officeId].officeLeadImage,
                  imageBuilder: (context, imageProvider) => officeTypeItemCards(
                    context: context,
                    officeImage: imageProvider,
                    officeName: listOfDummyOffice[widget.officeId].officeName,
                    officeLocation:
                        '${listOfDummyOffice[widget.officeId].officeLocation.city}, ${listOfDummyOffice[widget.officeId].officeLocation.district}',
                    officeStarRanting: listOfDummyOffice[widget.officeId]
                        .officeStarRating
                        .toString(),
                    officeApproxDistance: listOfDummyOffice[widget.officeId]
                        .officeApproxDistance
                        .toString(),
                    officePersonCapacity: listOfDummyOffice[widget.officeId]
                        .officePersonCapacity
                        .toString(),
                    officeArea: listOfDummyOffice[widget.officeId]
                        .officeArea
                        .toString(),
                    officeType: listOfDummyOffice[widget.officeId].officeType,
                  ),
                  placeholder: (context, url) => shimmerLoading(
                    child: CardShimmerHomeLoading.horizontalLoadShimmerHome,
                  ),
                  errorWidget: (context, url, error) =>
                      CardShimmerHomeLoading.horizontalFailedShimmerHome,
                ),
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
                child: readOnlyWidget(
                  controller: _dateController,
                  enblBorderRadius: 16,
                  errBorderRadius: 16,
                  fcsBorderRadius: 16,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select date check-in';
                    }
                    return null;
                  },
                  hint: 'day, date month year',
                  textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
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
                          padding: EdgeInsets.only(bottom: AdaptSize.pixel16),
                          child: SizedBox(
                            width: AdaptSize.screenWidth / 1.097561,
                            height: AdaptSize.screenWidth / 6.428571428,
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: AdaptSize.pixel16),
                                  child: SizedBox(
                                    width: AdaptSize.screenWidth / 6.428571428,
                                    height: AdaptSize.screenWidth / 6.428571428,
                                    child: const Image(
                                      image: AssetImage(
                                          "assets/image_assets/beverages_image/beverage1.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: AdaptSize.screenWidth / 1.875,
                                  height: AdaptSize.screenWidth / 6.428571428,
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
                                const Spacer(),

                                /// update 13 12 22 menambah spacer
                                customRadioButton(
                                    context: context,
                                    customRadioController: selectedBeverageId,
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
