import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

Widget popularSpaceWidget({
  context,
  required Function() onTap,
  required ImageProvider<Object> officeImage,
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
      /// canvas
      margin: const EdgeInsets.only(
        left: 5,
        right: 5,
        bottom: 10,
      ),
      width: AdaptSize.screenWidth * .5,
      decoration: BoxDecoration(
        color: MyColor.neutral900,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: const Offset(1, 3),
            color: MyColor.grayLightColor.withOpacity(.4),
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              /// image space
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image(
                  image: officeImage,
                ),
              ),
              Positioned(
                right: 10,
                top: 8,
                child: Stack(
                  children: [
                    /// ranting
                    Container(
                      height: AdaptSize.screenHeight * .035,
                      width: AdaptSize.screenHeight * .068,
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
                            size: AdaptSize.pixel20,
                          ),
                          Text(
                            officeStarRanting,
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: MyColor.whiteColor,
                                      fontSize: AdaptSize.pixel14,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          /// keterangan
          Flexible(
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  /// space name
                  Text(
                    officeName,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: AdaptSize.pixel16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),

                  /// space lokasi
                  Text(
                    officeLocation,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: AdaptSize.pixel14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const Spacer(),

                  /// keterangan kapasitas dan lokasi
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// icon lokasi
                      Icon(Icons.location_on_outlined,
                          size: AdaptSize.pixel18),

                      /// keterangan lokasi
                      Text(
                        officeApproxDistance,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: AdaptSize.pixel12),
                      ),

                      SizedBox(
                        width: AdaptSize.screenHeight * .008,
                      ),

                      /// keterangan available
                      SvgPicture.asset('assets/svg_assets/available.svg',
                          height: AdaptSize.pixel18),
                      const SizedBox(
                        width: 1,
                      ),
                      Text(
                        officePersonCapacity,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: AdaptSize.pixel12),
                      ),

                      SizedBox(
                        width: AdaptSize.screenHeight * .008,
                      ),

                      /// keteranganan jarak
                      SvgPicture.asset(
                        'assets/svg_assets/ruler.svg',
                        height: AdaptSize.pixel18,
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: Text(
                          officeArea,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: AdaptSize.pixel12),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),

                  /// harga
                  Row(
                    children: [
                      Text(
                        NumberFormat.currency(
                                locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                            .format(officePricing
                                // listOfDummyOffice[index]
                                //     .officePricing
                                //     .officePrice
                                ),
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: MyColor.darkBlueColor,
                              fontSize: AdaptSize.pixel14,
                            ),
                      ),
                      Text(
                        hours,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: AdaptSize.pixel10,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
