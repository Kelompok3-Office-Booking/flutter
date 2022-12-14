import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/utils/enums.dart';
import 'package:betterspace/src/view_model/login_viewmodel.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/view_model/office_viewmodels.dart';
import 'package:betterspace/src/widget/home_widget/home_screen_widget/all_populer.dart';
import 'package:betterspace/src/widget/widget/card_shimmer_widget.dart';
import 'package:betterspace/src/widget/home_widget/home_screen_widget/carousel_widget.dart';
import 'package:betterspace/src/widget/office_card_widget/vertical_card_home.dart';
import 'package:betterspace/src/widget/office_card_widget/horizontal_card_home.dart';
import 'package:betterspace/src/widget/home_widget/search_field.dart';
import 'package:betterspace/src/widget/widget/divider_widget.dart';
import 'package:betterspace/src/widget/widget/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration.zero, () async {
  //     final getOffice = Provider.of<OfficeViewModels>(context, listen: false);
  //     await getOffice.fetchCoworkingSpace();
  //     await getOffice.fetchMeetingRoom();
  //     await getOffice.fetchOfficeRoom();
  //     await getOffice.fetchOfficeByRecommendation();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final userAccountProvider =
        Provider.of<LoginViewmodels>(context, listen: false);
    final userAccountProviderListen =
        Provider.of<LoginViewmodels>(context, listen: true);
    if (userAccountProviderListen.userModels == null) {
      userAccountProvider.getProfile();
    }
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
                          userAccountProviderListen.userModels != null &&
                                  userAccountProviderListen
                                          .userModels?.userProfileDetails !=
                                      null
                              ? "Hi " +
                                  userAccountProviderListen
                                      .userModels!.userProfileDetails.userName
                              : 'Hi User',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: AdaptSize.pixel22),
                        ),
                        Text(
                          'Find your best workspace!',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: AdaptSize.pixel20),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
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
                hintText: 'Where do you want to work today?',
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
                height: AdaptSize.screenHeight * .005,
              ),

              /// divider
              dividerWdiget(
                width: double.infinity,
                opacity: .1,
              ),

              SizedBox(
                height: AdaptSize.screenHeight * .008,
              ),

              /// all coworking text
              allSpaces(context, 'Popular Coworking Space', () {}),

              SizedBox(
                height: AdaptSize.screenHeight * .016,
              ),

              ///  coworking space
              Consumer<OfficeViewModels>(builder: (context, value, child) {
                if (value.connectionState == stateOfConnections.isLoading) {
                  return shimmerLoading(
                    child: commonShimmerLoadWidget(
                      sizeHeight: AdaptSize.screenWidth / 2800 * 2000,
                      sizeWidth: double.infinity,
                    ),
                  );
                }
                if (value.connectionState == stateOfConnections.isReady) {
                  return SizedBox(
                    height: AdaptSize.screenWidth / 2800 * 2000,
                    width: double.infinity,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: value.listOfCoworkingSpace.length,
                        itemBuilder: (context, index) {
                          return verticalCardHome(
                            context: context,
                            onTap: () {
                              context
                                  .read<NavigasiViewModel>()
                                  .navigasiToDetailSpace(
                                    context: context,
                                    officeId: value
                                        .listOfCoworkingSpace[index].officeID,
                                  );
                            },
                            officeImage: value
                                .listOfCoworkingSpace[index].officeLeadImage,
                            officeName:
                                value.listOfCoworkingSpace[index].officeName,
                            officeLocation:
                                '${value.listOfCoworkingSpace[index].officeLocation.city}, ${value.listOfCoworkingSpace[index].officeLocation.district}',
                            officeStarRanting: value
                                .listOfCoworkingSpace[index].officeStarRating
                                .toString(),
                            officeApproxDistance: value
                                .listOfCoworkingSpace[index]
                                .officeApproxDistance
                                .toString(),
                            officePersonCapacity: value
                                .listOfCoworkingSpace[index]
                                .officePersonCapacity
                                .toString(),
                            officeArea: value
                                .listOfCoworkingSpace[index].officeArea
                                .toString(),
                            hours: '/Hours',
                            officePricing: value.listOfCoworkingSpace[index]
                                .officePricing.officePrice,
                          );
                        }),
                  );
                }
                if (value.connectionState == stateOfConnections.isFailed) {
                  return commonShimmerFailedLoadWidget(
                    sizeHeight: AdaptSize.screenWidth / 2800 * 2000,
                    sizeWidth: double.infinity,
                  );
                }
                return SizedBox(
                  height: AdaptSize.screenWidth / 2800 * 2000,
                  width: double.infinity,
                );
              }),

              SizedBox(
                height: AdaptSize.screenHeight * .008,
              ),

              /// all office rent text
              allSpaces(context, 'Office for Rent', () {}),

              SizedBox(
                height: AdaptSize.screenHeight * .016,
              ),

              /// office rent space
              Consumer<OfficeViewModels>(builder: (context, value, child) {
                if (value.connectionState == stateOfConnections.isLoading) {
                  return shimmerLoading(
                    child: commonShimmerLoadWidget(
                      sizeHeight: AdaptSize.screenWidth / 2800 * 2000,
                      sizeWidth: double.infinity,
                    ),
                  );
                }
                if (value.connectionState == stateOfConnections.isReady) {
                  return SizedBox(
                    height: AdaptSize.screenWidth / 2800 * 2000,
                    width: double.infinity,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: value.listOfOfficeRoom.length,
                        itemBuilder: (context, index) {
                          return verticalCardHome(
                            context: context,
                            onTap: () {
                              context
                                  .read<NavigasiViewModel>()
                                  .navigasiToDetailSpace(
                                    context: context,
                                    officeId:
                                        value.listOfOfficeRoom[index].officeID,
                                  );
                            },
                            officeImage:
                                value.listOfOfficeRoom[index].officeLeadImage,
                            officeName:
                                value.listOfOfficeRoom[index].officeName,
                            officeLocation:
                                '${value.listOfOfficeRoom[index].officeLocation.city}, ${value.listOfOfficeRoom[index].officeLocation.district}',
                            officeStarRanting: value
                                .listOfOfficeRoom[index].officeStarRating
                                .toString(),
                            officeApproxDistance: value
                                .listOfOfficeRoom[index].officeApproxDistance
                                .toString(),
                            officePersonCapacity: value
                                .listOfOfficeRoom[index].officePersonCapacity
                                .toString(),
                            officeArea: value.listOfOfficeRoom[index].officeArea
                                .toString(),
                            hours: '/Month',
                            officePricing: value.listOfOfficeRoom[index]
                                .officePricing.officePrice,
                          );
                        }),
                  );
                }
                if (value.connectionState == stateOfConnections.isFailed) {
                  return commonShimmerFailedLoadWidget(
                    sizeHeight: AdaptSize.screenWidth / 2800 * 2000,
                    sizeWidth: double.infinity,
                  );
                }
                return SizedBox(
                  height: AdaptSize.screenWidth / 2800 * 2000,
                  width: double.infinity,
                );
              }),

              SizedBox(
                height: AdaptSize.screenHeight * .008,
              ),

              /// all meeting room text
              allSpaces(context, 'Meeting Rooms', () {}),

              SizedBox(
                height: AdaptSize.screenHeight * .016,
              ),

              /// meeting space
              Consumer<OfficeViewModels>(builder: (context, value, child) {
                if (value.connectionState == stateOfConnections.isLoading) {
                  return shimmerLoading(
                    child: commonShimmerLoadWidget(
                        sizeHeight: AdaptSize.screenWidth / 2800 * 2000,
                        sizeWidth: double.infinity),
                  );
                }
                if (value.connectionState == stateOfConnections.isReady) {
                  return SizedBox(
                    height: AdaptSize.screenWidth / 2800 * 2000,
                    width: double.infinity,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: value.listOfMeetingRoom.length,
                        itemBuilder: (context, index) {
                          return verticalCardHome(
                            context: context,
                            onTap: () {
                              context
                                  .read<NavigasiViewModel>()
                                  .navigasiToDetailSpace(
                                    context: context,
                                    officeId:
                                        value.listOfMeetingRoom[index].officeID,
                                  );
                            },
                            officeImage:
                                value.listOfMeetingRoom[index].officeLeadImage,
                            officeName:
                                value.listOfMeetingRoom[index].officeName,
                            officeLocation:
                                '${value.listOfMeetingRoom[index].officeLocation.city}, ${value.listOfMeetingRoom[index].officeLocation.district}',
                            officeStarRanting: value
                                .listOfMeetingRoom[index].officeStarRating
                                .toString(),
                            officeApproxDistance: value
                                .listOfMeetingRoom[index].officeApproxDistance
                                .toString(),
                            officePersonCapacity: value
                                .listOfMeetingRoom[index].officePersonCapacity
                                .toString(),
                            officeArea: value
                                .listOfMeetingRoom[index].officeArea
                                .toString(),
                            hours: '/Hours',
                            officePricing: value.listOfMeetingRoom[index]
                                .officePricing.officePrice,
                          );
                        }),
                  );
                }
                if (value.connectionState == stateOfConnections.isFailed) {
                  return commonShimmerFailedLoadWidget(
                    sizeHeight: AdaptSize.screenWidth / 2800 * 2000,
                    sizeWidth: double.infinity,
                  );
                }
                return SizedBox(
                  height: AdaptSize.screenWidth / 2800 * 2000,
                  width: double.infinity,
                );
              }),

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
              Consumer<OfficeViewModels>(builder: (context, value, child) {
                if (value.connectionState == stateOfConnections.isLoading) {
                  return shimmerLoading(
                    child: commonShimmerLoadWidget(
                      sizeHeight: AdaptSize.screenWidth / 1000 * 360,
                      sizeWidth: double.infinity,
                    ),
                  );
                }
                if (value.connectionState == stateOfConnections.isReady) {
                  return MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: value.listOfOfficeByRecommendation.length,
                        itemBuilder: (context, index) {
                          return horizontalCardHome(
                            context: context,
                            onTap: () {
                              context
                                  .read<NavigasiViewModel>()
                                  .navigasiToDetailSpace(
                                    context: context,
                                    officeId: value
                                        .listOfOfficeByRecommendation[index]
                                        .officeID,
                                  );
                            },
                            officeImage: value
                                .listOfOfficeByRecommendation[index]
                                .officeLeadImage,
                            officeName: value
                                .listOfOfficeByRecommendation[index].officeName,
                            officeLocation:
                                '${value.listOfOfficeByRecommendation[index].officeLocation.city}, ${value.listOfOfficeByRecommendation[index].officeLocation.district}',
                            officeStarRanting: value
                                .listOfOfficeByRecommendation[index]
                                .officeStarRating
                                .toString(),
                            officeApproxDistance: value
                                .listOfOfficeByRecommendation[index]
                                .officeApproxDistance
                                .toString(),
                            officePersonCapacity: value
                                .listOfOfficeByRecommendation[index]
                                .officePersonCapacity
                                .toString(),
                            officeArea: value
                                .listOfOfficeByRecommendation[index].officeArea
                                .toString(),
                            hours: '/Hours',
                            officePricing: value
                                .listOfOfficeByRecommendation[index]
                                .officePricing
                                .officePrice,
                          );
                        }),
                  );
                }
                if (value.connectionState == stateOfConnections.isFailed) {
                  return commonShimmerFailedLoadWidget(
                    sizeHeight: AdaptSize.screenWidth / 1000 * 360,
                    sizeWidth: double.infinity,
                  );
                }
                return const SizedBox();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
