import 'package:betterspace/src/dummy_data/office_dummy_data.dart';
import 'package:betterspace/src/dummy_data/office_dummy_models.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/get_location_view_model.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/widget/home_widget/home_screen_widget/all_populer.dart';
import 'package:betterspace/src/widget/home_widget/home_screen_widget/carousel_widget.dart';
import 'package:betterspace/src/widget/home_widget/home_screen_widget/meeting_rent_widget.dart';
import 'package:betterspace/src/widget/home_widget/home_screen_widget/office_rent_widget.dart';
import 'package:betterspace/src/widget/home_widget/home_screen_widget/popular_coworking_widget.dart';
import 'package:betterspace/src/widget/home_widget/home_screen_widget/recomended_space_widget.dart';
import 'package:betterspace/src/widget/home_widget/search_field.dart';
import 'package:betterspace/src/widget/widget/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final getLocationUser =
        Provider.of<GetLocationViewModel>(context, listen: false);
    getLocationUser.getAddressFromLongLat(
        getLocationUser.posLatitude, getLocationUser.posLongitude);
  }

  @override
  Widget build(BuildContext context) {
    AdaptSize.size(context: context);
    final OfficeDataDummy dataDummyForOfficeModels = OfficeDataDummy();
    final List<OfficeModels> listOfOffice =
        dataDummyForOfficeModels.listOfOfficeModels;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            top: AdaptSize.paddingTop,
            left: AdaptSize.screenWidth * .016,
            right: AdaptSize.screenWidth * .016,
          ),
          child: Column(
            children: [
              /// header
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  left: AdaptSize.screenWidth * .01,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi Jhony',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontSize: AdaptSize.screenHeight * .022),
                        ),
                        Text(
                          'Find your best workspace!',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontSize: AdaptSize.screenHeight * .022),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ],
                    ),
                    const Spacer(),

                    /// notification
                    IconButton(
                      onPressed: () {
                        context
                            .read<NavigasiViewModel>()
                            .navigasiToNotification(context);
                      },
                      icon: const Icon(Icons.notifications_none),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: AdaptSize.screenHeight * .016,
              ),

              /// search text field
              searchPlace(
                /// search field
                context: context,
                hintText: 'Mau kerja dimana hari ini ?',
                onTap: () {
                  context
                      .read<NavigasiViewModel>()
                      .navigasiToSearchSpaces(context);
                },
                prefixIcon: Icon(
                  Icons.search,
                  color: MyColor.darkColor.withOpacity(.8),
                ),
                readOnly: true,
              ),

              SizedBox(
                height: AdaptSize.screenHeight * .016,
              ),

              /// promo
              carouselWidget(context),

              SizedBox(
                height: AdaptSize.screenHeight * .008,
              ),

              /// divider
              dividerWdiget(
                width: double.infinity,
                opacity: .1,
              ),

              SizedBox(
                height: AdaptSize.screenHeight * .008,
              ),

              /// all popular text
              allSpaces(context, 'Popular Coworking Space', () {}),

              SizedBox(
                height: AdaptSize.screenHeight * .016,
              ),

              /// popular space
              popularSpaceWidget(() {}),

              /// all office rent text
              allSpaces(context, 'Office for Rent', () {}),

              SizedBox(
                height: AdaptSize.screenHeight * .016,
              ),

              /// office rent space
              officeRentWidget(() {}),

              /// all meeting room text
              allSpaces(context, 'Meeting Rooms', () {}),

              SizedBox(
                height: AdaptSize.screenHeight * .016,
              ),

              /// meeting space
              meetingRoomWidget(() {}),

              SizedBox(
                height: AdaptSize.screenHeight * .008,
              ),

              /// divider
              dividerWdiget(
                width: double.infinity,
                opacity: .1,
              ),

              SizedBox(
                height: AdaptSize.screenHeight * .008,
              ),

              /// text recomended spaces
              allSpaces(context, 'Recommendation', () {}),

              SizedBox(
                height: AdaptSize.screenHeight * .016,
              ),

              /// recomended spaces
              recomenSpaces(context, () {}),
            ],
          ),
        ),
      ),
    );
  }
}
