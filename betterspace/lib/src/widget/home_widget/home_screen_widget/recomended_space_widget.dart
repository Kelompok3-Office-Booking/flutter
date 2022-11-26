import 'package:betterspace/src/model/data/recomended_data.dart';
import 'package:betterspace/src/model/recomended_space_model.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

Widget recomenSpaces(context, Function() onTap) {
  return MediaQuery.removePadding(
    removeTop: true,
    context: context,
    child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: recomendedSpace.length,
        itemBuilder: (context, index) {
          final RecomendedSpaceModel recomendedSpaces = recomendedSpace[index];

          /// cover
          return InkWell(
            onTap: onTap,
            child: Container(
              height: AdaptSize.screenHeight * .16,
              width: double.infinity,
              margin: EdgeInsets.only(bottom: AdaptSize.screenHeight * .008),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: MyColor.whiteColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(1, 3),
                    color: MyColor.darkColor.withOpacity(.4),
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Row(
                children: [
                  /// space image
                  Flexible(
                    fit: FlexFit.loose,
                    child: Stack(
                      children: [
                        Container(
                          width: AdaptSize.screenWidth * .36,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                recomendedSpaces.image,
                              ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: AdaptSize.screenHeight * 0.025,
                                    ),
                                    Text(
                                      '${recomendedSpaces.ranting}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              color: MyColor.whiteColor,
                                              fontSize: AdaptSize.screenHeight *
                                                  0.017),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// jarak samping
                  SizedBox(
                    width: AdaptSize.screenWidth * .008,
                  ),

                  /// keterangan
                  Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recomendedSpaces.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontSize: AdaptSize.screenHeight * .017),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),

                        /// jarak bawah
                        SizedBox(
                          height: AdaptSize.screenHeight * .008,
                        ),

                        /// lokasi
                        Text(recomendedSpaces.location),

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
                                size: AdaptSize.screenHeight * .025,
                              ),

                              /// keterangan lokasi
                              Text(
                                recomendedSpaces.destination,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize:
                                            AdaptSize.screenHeight * .014),
                              ),

                              SizedBox(
                                width: AdaptSize.screenHeight * .012,
                              ),

                              /// total person asset
                              SvgPicture.asset(
                                'assets/svg_assets/available.svg',
                                height: AdaptSize.screenHeight * .025,
                              ),

                              const SizedBox(
                                width: 2,
                              ),

                              /// total person
                              Text(
                                '${recomendedSpaces.totalPerson}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize:
                                            AdaptSize.screenHeight * .014),
                              ),

                              SizedBox(
                                width: AdaptSize.screenHeight * .012,
                              ),

                              /// icon penggaris
                              SvgPicture.asset(
                                'assets/svg_assets/ruler.svg',
                                height: AdaptSize.screenHeight * .025,
                              ),

                              const SizedBox(
                                width: 2,
                              ),

                              /// jarak lokasi
                              Text(
                                recomendedSpaces.distance,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize:
                                            AdaptSize.screenHeight * .014),
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
                                      locale: 'id',
                                      symbol: 'Rp ',
                                      decimalDigits: 0)
                                  .format(recomendedSpaces.price),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    color: MyColor.darkBlueColor,
                                    fontSize: AdaptSize.screenHeight * .016,
                                  ),
                            ),
                            Text(
                              '/hours',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize: AdaptSize.screenHeight * .011),
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
        }),
  );
}
