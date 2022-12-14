import 'dart:math';
import 'package:betterspace/src/model/office_models/office_dummy_data.dart';
import 'package:betterspace/src/model/office_models/office_dummy_models.dart';
import 'package:betterspace/src/model/user_whislist/user_whislist.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/utils/hex_color_convert.dart';
import 'package:betterspace/src/view_model/get_location_view_model.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/view_model/whislist_view_model.dart';
import 'package:betterspace/src/widget/widget/bottom_sheed_widget.dart';
import 'package:betterspace/src/widget/widget/button_widget.dart';
import 'package:betterspace/src/widget/widget/card_shimmer_widget.dart';
import 'package:betterspace/src/widget/widget/divider_widget.dart';
import 'package:betterspace/src/widget/widget/icon_with_label.dart';
import 'package:betterspace/src/widget/widget/shimmer_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OfficeDetailScreen extends StatelessWidget {
  final int officeID;

  const OfficeDetailScreen({super.key, required this.officeID});

  @override
  Widget build(BuildContext context) {
    final dummyDataProviders =
        Provider.of<OfficeDummyDataViewModels>(context, listen: false);
    List<OfficeModels> listOfDummyOffice =
        dummyDataProviders.listOfOfficeModels;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                left: AdaptSize.screenWidth * .016,
                right: AdaptSize.screenWidth * .016,
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// image header
                    CachedNetworkImage(
                      imageUrl: listOfDummyOffice[officeID].officeLeadImage,
                      imageBuilder: (context, imageProvider) => Container(
                        height: AdaptSize.screenWidth / 1.3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: imageProvider,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: IconButton(
                                onPressed: () {
                                  context
                                      .read<NavigasiViewModel>()
                                      .navigasiPop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  size: AdaptSize.pixel22,
                                  color: MyColor.neutral900,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Consumer<WhislistViewModel>(
                                  builder: (context, value, child) {
                                return IconButton(
                                  onPressed: () {
                                    final addNewWhislist = UserWhislistModel(
                                      officeId:
                                          DateTime.now().millisecondsSinceEpoch,
                                      officeName:
                                          listOfDummyOffice[officeID].officeName,
                                      officeRanting: listOfDummyOffice[officeID].officeStarRating,
                                      officeImage: listOfDummyOffice[officeID]
                                          .officeLeadImage,
                                      officeLocation:
                                          '${listOfDummyOffice[officeID].officeLocation.city}, ${listOfDummyOffice[officeID].officeLocation.district}',
                                      officeType:
                                          listOfDummyOffice[officeID].officeType,
                                    );

                                    value.addWhistlistOffice(addNewWhislist);
                                  },
                                  icon: Icon(
                                    value.onTaped
                                        ? Icons.bookmark
                                        : Icons.bookmark_outline,
                                    size: AdaptSize.pixel22,
                                    color: value.onTaped
                                        ? MyColor.secondary300
                                        : MyColor.neutral900,
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                      placeholder: (context, url) => shimmerLoading(
                        child: commonShimmerLoadWidget(),
                      ),
                      errorWidget: (context, url, error) =>
                          commonShimmerFailedLoadWidget(),
                    ),

                    SizedBox(
                      height: AdaptSize.pixel8,
                    ),

                    /// image bawahnya header
                    SizedBox(
                      height: AdaptSize.screenWidth / 3.5,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount:
                            listOfDummyOffice[officeID].officeGridImage.length,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CachedNetworkImage(
                            imageUrl: listOfDummyOffice[officeID]
                                .officeGridImage[index],
                            imageBuilder: (context, imageProvider) => Padding(
                              padding: EdgeInsets.only(right: AdaptSize.pixel8),
                              child: SizedBox(
                                height: AdaptSize.screenWidth / 3.25,
                                width: AdaptSize.screenWidth / 3.25,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            placeholder: (context, url) => shimmerLoading(
                              child: commonShimmerLoadWidget(),
                            ),
                            errorWidget: (context, url, error) =>
                                commonShimmerFailedLoadWidget(),
                          );
                        },
                      ),
                    ),

                    SizedBox(
                      height: AdaptSize.pixel8,
                    ),

                    /// text header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          listOfDummyOffice[officeID].officeName,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: AdaptSize.pixel22),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Container(
                            width: AdaptSize.screenWidth / 7.2,
                            height: AdaptSize.screenWidth / 15,
                            decoration: BoxDecoration(
                              color: MyColor.neutral300,
                              border:
                                  Border.all(width: 1, color: MyColor.neutral300),
                              borderRadius: BorderRadius.circular(42),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  color: MyColor.starYellow,
                                  size: AdaptSize.pixel16,
                                ),
                                Text(
                                  "${listOfDummyOffice[officeID].officeStarRating}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: MyColor.neutral900,
                                          fontSize: AdaptSize.pixel14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: AdaptSize.pixel8,
                    ),

                    /// keterangan lokasi
                    Row(
                      children: [
                        Icon(
                          Icons.domain,
                          color: MyColor.neutral100,
                          size: AdaptSize.pixel20,
                        ),
                        SizedBox(
                          width: AdaptSize.screenWidth * .005,
                        ),
                        Expanded(
                          child: Text(
                            '${listOfDummyOffice[officeID].officeLocation.city}, ${listOfDummyOffice[officeID].officeLocation.district}',
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: MyColor.neutral100,
                                      fontSize: AdaptSize.pixel14,
                                    ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),

                    /// keterangan jarak lokasi
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// location
                        IconWithLabel().asrow(
                            contexts: context,
                            usedIcon: Icons.location_on_outlined,
                            labelText: listOfDummyOffice[officeID]
                                .officeApproxDistance
                                .toString(),
                            spacer: AdaptSize.pixel4),

                        /// location 2
                        IconWithLabel().asrow(
                            contexts: context,
                            usedIcon: Icons.location_on_outlined,
                            labelText:
                                listOfDummyOffice[officeID].officeArea.toString(),
                            spacer: AdaptSize.pixel4),

                        /// location 3
                        IconWithLabel().asrow(
                            contexts: context,
                            usedIcon: Icons.person_outline,
                            labelText: listOfDummyOffice[officeID]
                                .officePersonCapacity
                                .toString(),
                            spacer: AdaptSize.pixel4),

                        /// loccation 4
                        IconWithLabel().asrow(
                            contexts: context,
                            usedIcon: Icons.access_time,
                            labelText: "08:00-23:00",
                            spacer: AdaptSize.pixel4),
                      ],
                    ),

                    SizedBox(
                      height: AdaptSize.pixel8,
                    ),

                    /// deskripsi
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: MyColor.neutral100, fontSize: AdaptSize.pixel16),
                    ),
                    SizedBox(
                      height: AdaptSize.pixel8,
                    ),
                    Text(
                      listOfDummyOffice[officeID].officeDescription,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: MyColor.neutral200,
                            fontSize: AdaptSize.pixel14,
                          ),
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.justify,
                    ),

                    SizedBox(
                      height: AdaptSize.pixel8,
                    ),

                    Text(
                      "Capacity",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: MyColor.neutral100,
                            fontSize: AdaptSize.pixel16,
                          ),
                    ),

                    /// list capacity
                    MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(top: AdaptSize.pixel8),
                        shrinkWrap: true,
                        itemCount: listOfDummyOffice[officeID]
                            .listOfOfficeCapcityModels
                            .length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  /// icon
                                  Padding(
                                    padding:
                                        EdgeInsets.only(right: AdaptSize.pixel8),
                                    child: Icon(
                                      CupertinoIcons
                                          .rectangle_arrow_up_right_arrow_down_left,
                                      color: MyColor.secondary400,
                                      size: AdaptSize.pixel22,
                                    ),
                                  ),

                                  /// text keterangan
                                  Text(
                                    "Can Accomodate",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: MyColor.neutral200),
                                  ),
                                  const Spacer(),

                                  /// detail person
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: listOfDummyOffice[officeID]
                                              .listOfOfficeCapcityModels[index]
                                              .capacityTitle,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color: MyColor.secondary400,
                                                  fontSize: AdaptSize.pixel16),
                                        ),
                                        TextSpan(
                                          text: "person",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color: MyColor.neutral200),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              dividerWdiget(width: double.infinity, opacity: .1),
                            ],
                          );
                        },
                      ),
                    ),

                    SizedBox(
                      height: AdaptSize.pixel8,
                    ),

                    Text(
                      "Facilities",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: MyColor.neutral100,
                          fontSize: AdaptSize.pixel16,
                          fontWeight: FontWeight.bold),
                    ),

                    /// list fasilitas
                    listFacilities(
                      context: context,
                      moreFacilitiesButton: () {
                        modalBottomSheed(context, listFacilityItem(context));
                      },
                    ),

                    Text(
                      "Address",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: MyColor.neutral100,
                            fontSize: AdaptSize.pixel16,
                          ),
                    ),

                    SizedBox(
                      height: AdaptSize.pixel8,
                    ),

                    /// alamat
                    Text(
                      '${listOfDummyOffice[officeID].officeLocation.city}, ${listOfDummyOffice[officeID].officeLocation.district}',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: MyColor.neutral200,
                            fontSize: AdaptSize.pixel14,
                          ),
                    ),

                    /// fitur google maps
                    InkWell(
                      onTap: () {
                        modalBottomSheed(
                          context,
                          showMaps(
                              context: context,
                              onPressed: () {
                                context
                                    .read<GetLocationViewModel>()
                                    .permissionLocationGMap(
                                      context,
                                      officeID,
                                    );
                              }),
                        );
                      },
                      splashColor: MyColor.transparanColor,
                      child: Container(
                        height: AdaptSize.screenHeight * .18,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(1, 2),
                              color: MyColor.neutral600.withOpacity(.5),
                              blurRadius: 3,
                            ),
                          ],
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/image_assets/mapimage.jpg'),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: AdaptSize.pixel8,
                    ),

                    Text(
                      "Review",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: MyColor.neutral100,
                            fontSize: AdaptSize.pixel16,
                          ),
                    ),

                    /// card review
                    cardReview(
                      buttonHelpfull: () {},
                    ),

                    SizedBox(
                      height: AdaptSize.screenWidth / 1000 * 150,
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// total harga
          Align(
            alignment: Alignment.bottomCenter,
            child: footerDetail(
              context: context,
              bookingButton: () {
                context
                    .read<NavigasiViewModel>()
                    .navigasiToCheckOut(context, officeID);
              },
            ),
          ),
        ],
      ),
    );
  }

  /// list of facilities widget
  Widget listFacilities({
    context,
    Function()? moreFacilitiesButton,
  }) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: AdaptSize.pixel8),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Column(
              children: [
                index == 4
                    ? InkWell(
                        splashColor: MyColor.transparanColor,
                        onTap: moreFacilitiesButton,
                        child: Row(
                          children: [
                            Icon(
                              Icons.grid_view_rounded,
                              size: AdaptSize.screenHeight * .024,
                              color: MyColor.secondary400,
                            ),
                            SizedBox(
                              width: AdaptSize.pixel8,
                            ),
                            Text(
                              'See more facilities (10)',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: MyColor.neutral200),
                            ),
                          ],
                        ),
                      )
                    : Row(
                        children: [
                          Icon(
                            Icons.wifi,
                            size: AdaptSize.screenHeight * .024,
                            color: MyColor.secondary400,
                          ),
                          SizedBox(
                            width: AdaptSize.pixel8,
                          ),
                          Text(
                            'Facilities',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: MyColor.neutral200),
                          ),
                        ],
                      ),
                dividerWdiget(width: double.infinity, opacity: .1),
              ],
            );
          }),
    );
  }

  /// ------------------------------------------------------------------------

  /// list facility item
  Widget listFacilityItem(context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AdaptSize.screenWidth * .016,
        right: AdaptSize.screenWidth * .016,
        bottom: AdaptSize.screenHeight * .008,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: dividerWdiget(
              width: AdaptSize.screenWidth * 0.1,
              opacity: .4,
            ),
          ),
          SizedBox(
            height: AdaptSize.screenHeight * .016,
          ),
          Text(
            'More Facilities',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: AdaptSize.screenHeight * .016,
                ),
          ),
          SizedBox(
            height: AdaptSize.screenHeight * .016,
          ),
          SizedBox(
            height: AdaptSize.screenHeight * .42,
            width: double.infinity,
            child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.grid_view_outlined,
                            size: AdaptSize.screenHeight * .024,
                            color: MyColor.secondary400,
                          ),
                          SizedBox(
                            width: AdaptSize.pixel8,
                          ),
                          Text(
                            'Facilities',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: MyColor.neutral200),
                          ),
                        ],
                      ),
                      dividerWdiget(width: double.infinity, opacity: .1),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

  /// ------------------------------------------------------------------------

  /// split card review
  Widget cardReview({
    Function()? buttonHelpfull,
  }) {
    return SizedBox(
      height: AdaptSize.screenWidth / 1000 * 470,
      width: double.infinity,
      child: ListView.builder(
          padding: EdgeInsets.only(bottom: AdaptSize.screenHeight * .01),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            /// canvas
            return Container(
              width: AdaptSize.screenWidth / 1000 * 840,
              padding: EdgeInsets.all(AdaptSize.screenHeight * .01),
              margin: index == 1
                  ? EdgeInsets.only(
                      left: AdaptSize.screenWidth * .03,
                      right: AdaptSize.screenWidth * .03,
                    )
                  : EdgeInsets.zero,
              decoration: BoxDecoration(
                color: MyColor.neutral900,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(1, 2),
                    spreadRadius: .2,
                    color: MyColor.neutral600.withOpacity(.5),
                    blurRadius: 3,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    /// user image
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                          'assets/image_assets/default_image_profile.png',
                        ),
                      ),

                      SizedBox(
                        width: AdaptSize.screenWidth * .008,
                      ),

                      /// user name & date post
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: AdaptSize.screenHeight * .004,
                          ),
                          Row(
                            children: [
                              ///name
                              Text(
                                'Shinta Arumi ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(fontSize: AdaptSize.pixel14),
                              ),

                              Icon(
                                Icons.brightness_1,
                                size: AdaptSize.pixel4,
                                color: MyColor.neutral600,
                              ),

                              /// date post
                              Text(
                                ' Jan 2022',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: AdaptSize.pixel14,
                                      color: MyColor.neutral600,
                                    ),
                              ),
                            ],
                          ),

                          /// star review
                          Icon(
                            Icons.star,
                            color: HexColor('E5D11A'),
                            size: AdaptSize.pixel22,
                          )
                        ],
                      )
                    ],
                  ),

                  SizedBox(
                    height: AdaptSize.pixel10,
                  ),

                  /// description
                  Text(
                    'Hmm, apayah, gua juga gatau nihHmm, apayah, gua juga gatau nihHmm, apayah, gua juga gatau nihHmm, apayah, gua juga gatau nihHmm, apayah, gua juga gatau nihHmm, apayah, gua juga gatau nihHmm, apayah, gua juga gatau nihHmm, apayah, gua juga gatau nih',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: AdaptSize.pixel14,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const Spacer(),

                  /// helpfull button
                  Container(
                    width: AdaptSize.screenHeight / 1000 * 150,
                    padding: EdgeInsets.all(AdaptSize.screenHeight * .008),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: MyColor.neutral200),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        /// icon button
                        InkWell(
                          splashColor: MyColor.transparanColor,
                          onTap: buttonHelpfull,
                          child: Icon(
                            Icons.thumb_up_alt_outlined,
                            size: AdaptSize.pixel14,
                          ),
                        ),

                        SizedBox(
                          width: AdaptSize.pixel4,
                        ),

                        /// helpfull text
                        Text(
                          'Helpfull (0)',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(fontSize: AdaptSize.pixel10),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  /// ------------------------------------------------------------------------

  /// split footer content
  Widget footerDetail({
    context,
    Function()? bookingButton,
  }) {
    return Container(
      height: AdaptSize.screenHeight * .09,
      width: double.infinity,
      margin: EdgeInsets.only(top: AdaptSize.pixel8),
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        left: AdaptSize.pixel16,
        right: AdaptSize.pixel16,
      ),
      decoration: BoxDecoration(
        color: MyColor.neutral900,
        boxShadow: [
          BoxShadow(
            color: MyColor.neutral300.withOpacity(.5),
            blurRadius: 4,
            blurStyle: BlurStyle.solid,
          )
        ],
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
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
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: MyColor.darkBlueColor,
                      fontSize: AdaptSize.pixel16,
                    ),
              ),
              Text(
                NumberFormat.currency(
                        locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                    .format(Random().nextDouble() * 400000),
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: MyColor.darkBlueColor,
                      fontSize: AdaptSize.pixel14,
                    ),
              ),
            ],
          ),
          buttonWidget(
            onPressed: bookingButton,
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
    );
  }

  /// ------------------------------------------------------------------------

  /// maps bottom sheed
  Widget showMaps({
    context,
    Function()? onPressed,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: AdaptSize.screenWidth * .016,
        right: AdaptSize.screenWidth * .016,
        bottom: AdaptSize.screenHeight * .008,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          dividerWdiget(
            width: AdaptSize.screenWidth * 0.1,
            opacity: .4,
          ),
          SizedBox(
            height: AdaptSize.screenHeight * .016,
          ),
          Text(
            'Want to location?',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontSize: AdaptSize.screenHeight * .02),
          ),
          SizedBox(
            height: AdaptSize.screenHeight * .016,
          ),
          Text(
            'You will be directed using Google Maps to the Office location',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: AdaptSize.screenHeight * .016,
                  color: MyColor.neutral300,
                ),
          ),
          SizedBox(
            height: AdaptSize.screenHeight * .024,
          ),

          /// button open google maps widget
          buttonWidget(
            onPressed: onPressed,
            sizeheight: AdaptSize.screenHeight * .044,
            sizeWidth: double.infinity,
            borderRadius: BorderRadius.circular(10),
            backgroundColor: MyColor.secondary400,
            child: Text(
              'Yes, Open Google Maps',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: MyColor.neutral900,
                    fontSize: AdaptSize.screenHeight * .016,
                  ),
            ),
          ),

          SizedBox(
            height: AdaptSize.screenHeight * .03,
          ),
        ],
      ),
    );
  }
}