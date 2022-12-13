import 'dart:math';
import 'package:betterspace/src/dummy_data/office_data/office_dummy_data.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/view_model/search_spaces_view_model.dart';
import 'package:betterspace/src/widget/home_widget/home_screen_widget/recomended_space_widget.dart';
import 'package:betterspace/src/widget/home_widget/search_field.dart';
import 'package:betterspace/src/widget/widget/card_shimmer_widget.dart';
import 'package:betterspace/src/widget/widget/shimmer_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class FilterSearchScreen extends StatefulWidget {
  const FilterSearchScreen({Key? key}) : super(key: key);

  @override
  State<FilterSearchScreen> createState() => _FilterSearchScreenState();
}

class _FilterSearchScreenState extends State<FilterSearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final searchFilter =
        Provider.of<SearchSpacesViewModel>(context, listen: false);
    searchFilter.listSpace = searchFilter.foundPlace;
    Future.delayed(Duration.zero, () {
      searchFilter.spaceFilter(_searchController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dummyDataProviders =
        Provider.of<OfficeDummyDataViewModels>(context, listen: false);
    dummyDataProviders.addRecord(15);
    final listOfDummyOffice = dummyDataProviders.listOfOfficeModels;
    return Scaffold(
      body: Consumer<SearchSpacesViewModel>(builder: (context, values, child) {
        return Padding(
          padding: EdgeInsets.only(
            left: AdaptSize.screenWidth * .016,
            right: AdaptSize.screenWidth * .016,
            top: AdaptSize.paddingTop + 3,
          ),
          child: Column(
            children: [
              /// text field
              searchPlace(
                /// search keyword
                context: context,
                margin: EdgeInsets.only(
                  bottom: AdaptSize.screenHeight * .016,
                ),
                hintText: 'Type keyword...',
                controller: _searchController,
                onChanged: (value) => values.spaceFilter(value!),
                prefixIcon: IconButton(
                  onPressed: () {
                    context.read<NavigasiViewModel>().navigasiPop(context);
                  },
                  splashColor: MyColor.neutral900,
                  icon: Icon(
                    Icons.arrow_back,
                    color: MyColor.darkColor.withOpacity(.8),
                  ),
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: MyColor.neutral600,
                ),
                readOnly: false,
              ),

              /// content
              Expanded(
                child: values.foundPlace.isNotEmpty
                    ? MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView.builder(
                          itemCount: values.foundPlace.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              context
                                  .read<NavigasiViewModel>()
                                  .navigasiToDetailSpace(
                                    context: context,
                                    officeId: index,
                                  );
                            },
                            splashColor: MyColor.neutral900,
                            borderRadius: BorderRadius.circular(16),
                            child: Card(
                              key: ValueKey(values.foundPlace[index].name),
                              color: MyColor.neutral900,
                              elevation: 0,
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              child: CachedNetworkImage(
                                imageUrl:
                                    listOfDummyOffice[index].officeLeadImage,
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
                                  officeName: values.foundPlace[index].name,
                                  officeLocation:
                                      values.foundPlace[index].areaLocation,
                                  officeStarRanting: values
                                      .foundPlace[index].officeRanting
                                      .toString(),
                                  officeApproxDistance: '100',
                                  officePersonCapacity: '100',
                                  officeArea: values
                                      .foundPlace[index].officeBuildingArea,
                                  hours: '/Hours',
                                  officePricing: Random().nextDouble() * 300000,
                                ),
                                placeholder: (context, url) => shimmerLoading(
                                  child: CardShimmerHomeLoading
                                      .horizontalLoadShimmerHome,
                                ),
                                errorWidget: (context, url, error) =>
                                    CardShimmerHomeLoading
                                        .horizontalFailedShimmerHome,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Align(
                        alignment: Alignment.center,
                        child: Text(
                          'No results found',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: AdaptSize.pixel16),
                        ),
                      ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget searchContent({
    required String image,
    required String name,
    required String location,
    required String buildingArea,
    required String category,
    required int totalBooking,
    required double officeRanting,
  }) {
    return SizedBox(
      height: AdaptSize.screenWidth / 2800 * 2000,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            /// space image
            Stack(
              children: [
                /// image space
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 8,
                  child: Stack(
                    children: [
                      /// ranting
                      Container(
                        height: AdaptSize.screenHeight * .028,
                        width: AdaptSize.screenHeight * .06,
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                            left: AdaptSize.screenHeight * .005,
                            right: AdaptSize.screenHeight * .005),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: MyColor.grayLightColor.withOpacity(.6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: AdaptSize.screenHeight * 0.02,
                            ),
                            Text(
                              '$officeRanting',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      color: MyColor.whiteColor,
                                      fontSize: AdaptSize.screenHeight * 0.014),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            /// jarak samping
            SizedBox(
              width: AdaptSize.screenWidth * .01,
            ),

            /// keterangan
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: AdaptSize.pixel16),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  /// jarak bawah
                  SizedBox(
                    height: AdaptSize.screenHeight * .008,
                  ),

                  /// lokasi
                  Text(
                    location,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: AdaptSize.pixel14),
                  ),

                  /// jarak bawah
                  SizedBox(
                    height: AdaptSize.screenHeight * .008,
                  ),

                  /// icon keterangan
                  Flexible(
                    child: Row(
                      children: [
                        /// icon lokasi
                        Icon(
                          Icons.location_on_outlined,
                          size: AdaptSize.pixel22,
                        ),

                        const SizedBox(
                          width: 1,
                        ),

                        /// keterangan lokasi
                        Text(
                          '50m',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: AdaptSize.screenHeight * .014),
                        ),

                        SizedBox(
                          width: AdaptSize.screenHeight * .008,
                        ),

                        /// total person asset
                        SvgPicture.asset(
                          'assets/svg_assets/available.svg',
                          height: AdaptSize.screenHeight * .025,
                        ),

                        const SizedBox(
                          width: 1,
                        ),

                        /// total person
                        Text(
                          '$totalBooking',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: AdaptSize.screenHeight * .014),
                        ),

                        SizedBox(
                          width: AdaptSize.screenHeight * .008,
                        ),

                        /// icon penggaris
                        SvgPicture.asset(
                          'assets/svg_assets/ruler.svg',
                          height: AdaptSize.screenHeight * .025,
                        ),

                        const SizedBox(
                          width: 1,
                        ),

                        /// jarak lokasi
                        Text(
                          buildingArea,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: AdaptSize.screenHeight * .014),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),

                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: MyColor.primary700,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.5),
                      child: Text(
                        category,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: MyColor.primary700,
                            fontSize: AdaptSize.screenHeight * .014),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
