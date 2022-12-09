import 'dart:math';
import 'package:betterspace/src/dummy_data/office_data/office_dummy_data.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/widget/home_widget/home_screen_widget/all_populer.dart';
import 'package:betterspace/src/widget/widget/card_shimmer_widget.dart';
import 'package:betterspace/src/widget/home_widget/home_screen_widget/carousel_widget.dart';
import 'package:betterspace/src/widget/home_widget/home_screen_widget/office_card_widget.dart';
import 'package:betterspace/src/widget/home_widget/home_screen_widget/recomended_space_widget.dart';
import 'package:betterspace/src/widget/home_widget/search_field.dart';
import 'package:betterspace/src/widget/widget/divider_widget.dart';
import 'package:betterspace/src/widget/widget/shimmer_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdaptSize.size(context: context);
    final dummyDataProviders =
        Provider.of<OfficeDummyDataViewModels>(context, listen: false);
    dummyDataProviders.addRecord(5);
    final listOfDummyOffice = dummyDataProviders.listOfOfficeModels;
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

              /// coworking space
              SizedBox(
                height: AdaptSize.screenHeight * .31,
                width: double.infinity,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: listOfDummyOffice.length,
                    itemBuilder: (context, index) {
                      return CachedNetworkImage(
                        imageUrl: listOfDummyOffice[index].officeLeadImage,
                        imageBuilder: (context, imageProvider) =>
                            popularSpaceWidget(
                          context: context,
                          onTap: () {
                            context
                                .read<NavigasiViewModel>()
                                .navigasiToDetailSpace(
                                  context: context,
                                  officeId: index,
                                );
                          },
                          officeImage: imageProvider,
                          officeName: listOfDummyOffice[index].officeName,
                          officeLocation:
                              '${listOfDummyOffice[index].officeLocation.city}, ${listOfDummyOffice[index].officeLocation.district}',
                          officeStarRanting: listOfDummyOffice[index]
                              .officeStarRating
                              .toString(),
                          officeApproxDistance: listOfDummyOffice[index]
                              .officeApproxDistance
                              .toString(),
                          officePersonCapacity: listOfDummyOffice[index]
                              .officePersonCapacity
                              .toString(),
                          officeArea:
                              listOfDummyOffice[index].officeArea.toString(),
                          hours: '/Hours',
                          officePricing: Random().nextDouble() * 100000,
                        ),
                        placeholder: (context, url) => shimmerLoading(
                          child: CardShimmerHomeLoading.verticalShimmerHome,
                        ),
                        errorWidget: (context, url, error) =>
                            CardShimmerHomeLoading.verticalFailedLoadShimmer,
                      );
                    }),
              ),

              /// all office rent text
              allSpaces(context, 'Office for Rent', () {}),

              SizedBox(
                height: AdaptSize.screenHeight * .016,
              ),

              /// office rent space
              SizedBox(
                height: AdaptSize.screenHeight * .31,
                width: double.infinity,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: listOfDummyOffice.length,
                    itemBuilder: (context, index) {
                      return CachedNetworkImage(
                        imageUrl: listOfDummyOffice[index].officeLeadImage,
                        imageBuilder: (context, imageProvider) =>
                            popularSpaceWidget(
                          context: context,
                          onTap: () {
                            context
                                .read<NavigasiViewModel>()
                                .navigasiToDetailSpace(
                                  context: context,
                                  officeId: index,
                                );
                          },
                          officeImage: imageProvider,
                          officeName: listOfDummyOffice[index].officeName,
                          officeLocation:
                              '${listOfDummyOffice[index].officeLocation.city}, ${listOfDummyOffice[index].officeLocation.district}',
                          officeStarRanting: listOfDummyOffice[index]
                              .officeStarRating
                              .toString(),
                          officeApproxDistance: listOfDummyOffice[index]
                              .officeApproxDistance
                              .toString(),
                          officePersonCapacity: listOfDummyOffice[index]
                              .officePersonCapacity
                              .toString(),
                          officeArea:
                              listOfDummyOffice[index].officeArea.toString(),
                          hours: '/Month',
                          officePricing: Random().nextDouble() * 1000000,
                        ),
                        placeholder: (context, url) => shimmerLoading(
                          child: CardShimmerHomeLoading.verticalShimmerHome,
                        ),
                        errorWidget: (context, url, error) =>
                            CardShimmerHomeLoading.verticalFailedLoadShimmer,
                      );
                    }),
              ),

              /// all meeting room text
              allSpaces(context, 'Meeting Rooms', () {}),

              SizedBox(
                height: AdaptSize.screenHeight * .016,
              ),

              /// meeting space
              SizedBox(
                height: AdaptSize.screenHeight * .31,
                width: double.infinity,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: listOfDummyOffice.length,
                    itemBuilder: (context, index) {
                      return CachedNetworkImage(
                        imageUrl: listOfDummyOffice[index].officeLeadImage,
                        imageBuilder: (context, imageProvider) =>
                            popularSpaceWidget(
                          context: context,
                          onTap: () {
                            context
                                .read<NavigasiViewModel>()
                                .navigasiToDetailSpace(
                                  context: context,
                                  officeId: index,
                                );
                          },
                          officeImage: imageProvider,
                          officeName: listOfDummyOffice[index].officeName,
                          officeLocation:
                              '${listOfDummyOffice[index].officeLocation.city}, ${listOfDummyOffice[index].officeLocation.district}',
                          officeStarRanting: listOfDummyOffice[index]
                              .officeStarRating
                              .toString(),
                          officeApproxDistance: listOfDummyOffice[index]
                              .officeApproxDistance
                              .toString(),
                          officePersonCapacity: listOfDummyOffice[index]
                              .officePersonCapacity
                              .toString(),
                          officeArea:
                              listOfDummyOffice[index].officeArea.toString(),
                          hours: '/Hours',
                          officePricing: Random().nextDouble() * 500000,
                        ),
                        placeholder: (context, url) => shimmerLoading(
                          child: CardShimmerHomeLoading.verticalShimmerHome,
                        ),
                        errorWidget: (context, url, error) =>
                            CardShimmerHomeLoading.verticalFailedLoadShimmer,
                      );
                    }),
              ),

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
              MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listOfDummyOffice.length,
                    itemBuilder: (context, index) {
                      return CachedNetworkImage(
                        imageUrl: listOfDummyOffice[index].officeLeadImage,
                        imageBuilder: (context, imageProvider) =>
                          recomenSpaces(
                              context: context,
                              onTap: () {
                                context
                                    .read<NavigasiViewModel>()
                                    .navigasiToDetailSpace(
                                      context: context,
                                      officeId: index,
                                    );
                              },
                              officeImage: imageProvider,
                              officeName: listOfDummyOffice[index].officeName,
                              officeLocation:
                                  '${listOfDummyOffice[index].officeLocation.city}, ${listOfDummyOffice[index].officeLocation.district}',
                              officeStarRanting: listOfDummyOffice[index]
                                  .officeStarRating
                                  .toString(),
                              officeApproxDistance: listOfDummyOffice[index]
                                  .officeApproxDistance
                                  .toString(),
                              officePersonCapacity: listOfDummyOffice[index]
                                  .officePersonCapacity
                                  .toString(),
                              officeArea:
                                  listOfDummyOffice[index].officeArea.toString(),
                              hours: '/Hours',
                              officePricing: Random().nextDouble() * 300000,
                            ),
                        placeholder: (context, url) => shimmerLoading(
                          child: CardShimmerHomeLoading.horizontalLoadShimmerHome,
                        ),
                        errorWidget: (context, url, error) =>
                        CardShimmerHomeLoading.horizontalFailedShimmerHome,
                      );

                      //
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
