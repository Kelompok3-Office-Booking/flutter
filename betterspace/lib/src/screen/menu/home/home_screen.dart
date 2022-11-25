import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/widget/home_screen_widget/all_populer.dart';
import 'package:betterspace/src/widget/home_screen_widget/carousel_widget.dart';
import 'package:betterspace/src/widget/home_screen_widget/meeting_rent_widget.dart';
import 'package:betterspace/src/widget/home_screen_widget/office_rent_widget.dart';
import 'package:betterspace/src/widget/home_screen_widget/popular_coworking_widget.dart';
import 'package:betterspace/src/widget/home_screen_widget/recomended_space_widget.dart';
import 'package:betterspace/src/widget/home_screen_widget/search_field.dart';
import 'package:betterspace/src/widget/widget/divider_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AdaptSize.size(context: context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            top: AdaptSize.paddingTop + 5,
            left: AdaptSize.screenWidth * .016,
            right: AdaptSize.screenWidth * .016,
          ),
          child: Column(
            children: [
              /// header
              SizedBox(
                width: double.infinity,
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
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.notifications_none,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: AdaptSize.screenHeight * .016,
              ),

              /// text field
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(3, 3),
                      color: MyColor.grayLightColor.withOpacity(.4),
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: searchPlace(
                  /// search field
                  context,
                  'Mau kerja dimana hari ini ?',
                  searchController,
                  Icon(
                    Icons.search,
                    color: MyColor.darkColor.withOpacity(.8),
                  ),
                ),
              ),

              SizedBox(
                height: AdaptSize.screenHeight * .016,
              ),

              /// promo
              carouselWidget(),

              SizedBox(
                height: AdaptSize.screenHeight * .008,
              ),

              /// divider
              dividerWdiget(),

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
              officeRentWidget((){}),

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
              dividerWdiget(),

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
