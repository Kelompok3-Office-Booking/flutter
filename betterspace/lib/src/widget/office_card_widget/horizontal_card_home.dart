import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/widget/widget/card_shimmer_widget.dart';
import 'package:betterspace/src/widget/widget/shimmer_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

Widget horizontalCardHome({
  context,
  required Function() onTap,
  required String officeImage,
  required String officeName,
  required String officeLocation,
  required String officeStarRanting,
  required String officeApproxDistance,
  required String officePersonCapacity,
  required String officeArea,
  required String hours,
  required double officePricing,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: AdaptSize.screenWidth / 1000 * 360,
      width: double.infinity,
      margin: EdgeInsets.only(
        bottom: AdaptSize.screenHeight * .008,
      ),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: MyColor.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: const Offset(1, 3),
            color: MyColor.grayLightColor.withOpacity(.4),
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        children: [
          /// space image
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: officeImage,
                imageBuilder: (context, imageProvider) => Container(
                  width: AdaptSize.screenWidth * .36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: imageProvider,
                    ),
                  ),
                ),
                placeholder: (context, url) => shimmerLoading(
                  child: CardShimmerHomeLoading.horizontalLoadShimmerHome,
                ),
                errorWidget: (context, url, error) =>
                    CardShimmerHomeLoading.horizontalFailedShimmerHome(context),
              ),
              Positioned(
                left: 10,
                top: 8,
                child: Stack(
                  children: [
                    /// ranting
                    Container(
                      height: AdaptSize.screenWidth / 1000 * 70,
                      width: AdaptSize.screenWidth / 1000 * 150,
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
                            size: AdaptSize.pixel18,
                          ),
                          Text(
                            officeStarRanting,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    color: MyColor.whiteColor,
                                    fontSize: AdaptSize.pixel14),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
            width: AdaptSize.screenWidth * .008,
          ),

          /// keterangan
          Flexible(
            fit: FlexFit.loose,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  officeName,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: AdaptSize.pixel16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                /// jarak bawah
                SizedBox(
                  height: AdaptSize.screenHeight * .008,
                ),

                /// lokasi
                Text(
                  officeLocation,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: AdaptSize.pixel14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
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
                        size: AdaptSize.pixel18,
                      ),

                      /// keterangan lokasi
                      Text(
                        officeApproxDistance,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: AdaptSize.pixel12),
                      ),

                      SizedBox(
                        width: AdaptSize.screenHeight * .012,
                      ),

                      /// total person asset
                      SvgPicture.asset(
                        'assets/svg_assets/available.svg',
                        height: AdaptSize.pixel18,
                      ),

                      const SizedBox(
                        width: 2,
                      ),

                      /// total person
                      Text(
                        officePersonCapacity,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: AdaptSize.pixel12),
                      ),

                      SizedBox(
                        width: AdaptSize.screenHeight * .012,
                      ),

                      /// icon penggaris
                      SvgPicture.asset(
                        'assets/svg_assets/ruler.svg',
                        height: AdaptSize.pixel18,
                      ),

                      const SizedBox(
                        width: 2,
                      ),

                      /// luas area lokasi
                      Text(
                        officeArea,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: AdaptSize.pixel12),
                      ),
                    ],
                  ),
                ),
                const Spacer(),

                /// harga
                Row(
                  children: [
                    Text(
                      NumberFormat.currency(
                              locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                          .format(officePricing),
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: MyColor.darkBlueColor,
                            fontSize: AdaptSize.pixel15,
                          ),
                    ),
                    Text(
                      hours,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: AdaptSize.pixel10),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
