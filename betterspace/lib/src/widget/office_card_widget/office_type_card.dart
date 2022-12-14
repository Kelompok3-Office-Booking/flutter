import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget officeTypeItemCards({
  context,
  Function()? onTap,
  required ImageProvider<Object> officeImage,
  required String officeName,
  required String officeLocation,
  required String officeStarRanting,
  required String officeApproxDistance,
  required String officePersonCapacity,
  required String officeArea,
  required String officeType,
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
              Container(
                width: AdaptSize.screenWidth * .36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: officeImage,
                  ),
                ),
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

                SizedBox(
                    width: AdaptSize.screenWidth / 4,
                    height: AdaptSize.screenHeight / 33.3,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: AdaptSize.screenWidth / 4,
                          height: AdaptSize.screenHeight / 33.3,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: MyColor.neutral900,
                              border: Border.all(
                                  width: 1, color: MyColor.primary700),
                              borderRadius: BorderRadius.circular(42),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            officeType,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: MyColor.primary700, fontSize: AdaptSize.pixel10),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    ),
  );
  //   SizedBox(
  //   height: AdaptSize.screenWidth / 2.571429,
  //   child: itemCards(
  //     cardBottomPadding: cardBottomPaddings ?? AdaptSize.pixel8,
  //     cardBorderRadius: cardBottomPaddings ?? 16,
  //     childWidgets: SizedBox(
  //       width: AdaptSize.screenWidth / 1.125,
  //       height: AdaptSize.screenWidth / 2.72727273,
  //       child: Row(
  //         children: [
  //           imageItemFrameRounded(
  //             itemHeight: AdaptSize.screenWidth / 2.72727273,
  //             itemWidth: AdaptSize.screenWidth / 2.72727273,
  //             Images: Image(
  //               image: contentImage ??
  //                   AssetImage("assets/image_assets/space_image/space1.png"),
  //               fit: BoxFit.cover,
  //             ),
  //             frameRadius: 16,
  //             imagePadding: EdgeInsets.only(
  //               top: AdaptSize.pixel4,
  //               bottom: AdaptSize.pixel4,
  //               left: AdaptSize.pixel4,
  //               right: AdaptSize.pixel8,
  //             ),
  //           ),
  //           Padding(
  //             padding: EdgeInsets.only(
  //               top: AdaptSize.pixel8,
  //               bottom: AdaptSize.pixel6,
  //               right: AdaptSize.pixel10,
  //             ),
  //             child: SizedBox(
  //               height: AdaptSize.screenWidth / 2.7692307,
  //               width: AdaptSize.screenWidth / 2.155698,
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     contentTitle ?? "content title",
  //                     style: Theme.of(contexts).textTheme.bodyMedium!.copyWith(
  //                         color: MyColor.neutral100,
  //                         fontSize: AdaptSize.screenHeight / 1000 * 18,
  //                         fontWeight: FontWeight.bold),
  //                   ),
  //                   Expanded(child: SizedBox()),
  //                   Padding(
  //                     padding: EdgeInsets.only(bottom: AdaptSize.pixel6),
  //                     child: Text(
  //                       "content text, content text",
  //                       style:
  //                           Theme.of(contexts).textTheme.bodyMedium!.copyWith(
  //                                 color: MyColor.neutral100,
  //                                 fontSize: AdaptSize.screenHeight / 1000 * 14,
  //                               ),
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: EdgeInsets.only(bottom: AdaptSize.pixel6),
  //                     child: SizedBox(
  //                       height: AdaptSize.pixel24,
  //                       child: Row(
  //                         children: [
  //                           IconWithLabel().asrow(
  //                             contexts: contexts,
  //                             usedIcon: Icons.location_on_outlined,
  //                             labelText: "12 Km",
  //                           ),
  //                           IconWithLabel().asrow(
  //                             contexts: contexts,
  //                             usedIcon: Icons.location_on_outlined,
  //                             labelText: "12 Km",
  //                           ),
  //                           IconWithLabel().asrow(
  //                             contexts: contexts,
  //                             usedIcon: Icons.location_on_outlined,
  //                             labelText: "12 Km",
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     width: AdaptSize.screenWidth / 5.2173913,
  //                     height: AdaptSize.pixel22,
  //                     child: transactionStatusWidget(
  //                         contexts: contexts,
  //                         statusText: "Coworking",
  //                         statusBodyColor: MyColor.neutral900,
  //                         statusBorderColor: MyColor.primary700,
  //                         statusTextColor: MyColor.primary700),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   ),
  // );
}
