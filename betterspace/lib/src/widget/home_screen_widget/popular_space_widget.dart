import 'package:betterspace/src/model/data/popular_data.dart';
import 'package:betterspace/src/model/popular_space_model.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

Widget popularSpaceWidget(Function() onTap) {
  return SizedBox(
    height: AdaptSize.screenWidth * .654,
    width: double.infinity,
    child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: popularSpace.length,
        itemBuilder: (context, index) {
          final PopularSpaceModel popularSpaces = popularSpace[index];
          return InkWell(
            onTap: onTap,
            child: Container(
              /// canvas
              margin: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
              width: AdaptSize.screenWidth * .4,
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
              child: Column(
                children: [
                  Stack(
                    children: [
                      /// image space
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          popularSpaces.image,
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
                              height: AdaptSize.screenHeight * .039,
                              width: AdaptSize.screenHeight * .069,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: MyColor.grayLightColor.withOpacity(.6),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    '${popularSpaces.ranting}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(color: MyColor.whiteColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                            popularSpaces.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    fontSize: AdaptSize.screenHeight * .017),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Spacer(),

                          /// space lokasi
                          Text(popularSpaces.location),

                          const Spacer(),

                          /// keterangan kapasitas dan lokasi
                          Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/svg_assets/available.svg'),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                '${popularSpaces.totalPerson}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize:
                                            AdaptSize.screenHeight * .014),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SvgPicture.asset('assets/svg_assets/ruler.svg'),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                popularSpaces.distance,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize:
                                            AdaptSize.screenHeight * .014),
                              ),
                            ],
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
                                    .format(popularSpaces.price),
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
                                      fontSize: AdaptSize.screenHeight * .011,
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
        }),
  );
}
