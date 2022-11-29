import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/view_model/search_spaces_view_model.dart';
import 'package:betterspace/src/widget/home_widget/search_field.dart';
import 'package:betterspace/src/widget/home_widget/search_screen_widget/amount_guest_widget.dart';
import 'package:betterspace/src/widget/home_widget/search_screen_widget/search_map_widget.dart';
import 'package:betterspace/src/widget/widget/button_widget.dart';
import 'package:betterspace/src/widget/widget/read_only_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchSpaceScreen extends StatefulWidget {
  const SearchSpaceScreen({Key? key}) : super(key: key);

  @override
  State<SearchSpaceScreen> createState() => _SearchSpaceScreenState();
}

class _SearchSpaceScreenState extends State<SearchSpaceScreen> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    _dateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            left: AdaptSize.screenWidth * .016,
            right: AdaptSize.screenWidth * .016,
            top: AdaptSize.paddingTop,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// text header
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<NavigasiViewModel>().navigasiPop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: AdaptSize.screenHeight * 0.022,
                    ),
                  ),
                  SizedBox(
                    width: AdaptSize.screenWidth * 0.01,
                  ),
                  Text(
                    'Find Your Best Work Place !',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: AdaptSize.screenHeight * 0.022),
                  ),
                ],
              ),

              SizedBox(
                height: AdaptSize.screenHeight * 0.024,
              ),

              /// text field
              searchPlace(
                /// search field
                context: context,
                margin: EdgeInsets.only(
                  left: AdaptSize.screenWidth * .022,
                  right: AdaptSize.screenWidth * .022,
                ),
                hintText: 'Mau kerja dimana hari ini ?',
                controller: _searchController,
                prefixIcon: Icon(
                  Icons.search,
                  color: MyColor.darkColor.withOpacity(.8),
                ),
                readOnly: false,
              ),

              SizedBox(
                height: AdaptSize.screenHeight * 0.024,
              ),

              /// list map search
              searchMapWidget(),

              SizedBox(
                height: AdaptSize.screenHeight * 0.034,
              ),

              /// date picker
              Container(
                height: AdaptSize.screenHeight * 0.127,
                width: double.infinity,
                padding: EdgeInsets.all(AdaptSize.screenHeight * .01),
                decoration: BoxDecoration(
                  color: MyColor.netralColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(1, 2),
                      color: MyColor.grayLightColor.withOpacity(.4),
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'When you\'r come ?',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: AdaptSize.screenHeight * 0.022),
                    ),

                    SizedBox(
                      height: AdaptSize.screenHeight * 0.014,
                    ),

                    /// date text field
                    Flexible(
                      fit: FlexFit.loose,
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
                  ],
                ),
              ),

              SizedBox(
                height: AdaptSize.screenHeight * 0.034,
              ),

              Padding(
                padding: EdgeInsets.only(
                  left: AdaptSize.screenWidth * .025,
                  bottom: AdaptSize.screenHeight * .022,
                ),
                child: Text(
                  'With whom did you come here ?',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: AdaptSize.screenHeight * 0.022),
                ),
              ),

              /// personality
              amountGuestWidget(
                context,
                () {},
                'Personality',
                '',
              ),

              /// with friends
              amountGuestWidget(
                context,
                () {},
                'Meeting Room',
                '10',
              ),

              /// find place button
              buttonWidget(
                sizeheight: AdaptSize.screenHeight / 14,
                sizeWidth: double.infinity,
                onPressed: () {},
                margin: EdgeInsets.only(
                  left: AdaptSize.screenWidth * .025,
                  right: AdaptSize.screenWidth * .025,
                ),
                borderRadius: BorderRadius.circular(10),
                backgroundColor: MyColor.darkBlueColor,
                child: Text(
                  'Find Place',
                  style: Theme.of(context).textTheme.button!.copyWith(
                        color: MyColor.whiteColor,
                        fontSize: AdaptSize.screenHeight * 0.018,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// show date picker
  Future pickedDate(BuildContext context) async {
    final dateProvider = Provider.of<SearchSpacesViewModel>(context, listen: false);

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
