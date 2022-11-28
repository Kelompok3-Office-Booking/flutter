import 'package:betterspace/src/model/popular_coworking_model.dart';
import 'package:betterspace/src/model/data/popular_coworking_data.dart';
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
        itemCount: popularCoworkingSpace.length,
        itemBuilder: (context, index) {
          final PopularCoworkingSpaceModel popularCoworking =
              popularCoworkingSpace[index];
          return InkWell(
            onTap: onTap,
            child: Container(
              /// canvas
              margin: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
              width: AdaptSize.screenWidth * .42,
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
              child: Column(
                children: [
                  Stack(
                    children: [
                      /// image space
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          popularCoworking.image,
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
                                    '${popularCoworking.ranting}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                            color: MyColor.whiteColor,
                                            fontSize:
                                                AdaptSize.screenHeight * 0.017),
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
                            popularCoworking.name,
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
                          Text(popularCoworking.location),

                          const Spacer(),

                          /// keterangan kapasitas dan lokasi
                          Row(
                            children: [

                              /// icon lokasi
                              Icon(Icons.location_on_outlined,
                                  size: AdaptSize.screenHeight * .023),

                              /// keterangan lokasi
                              Text(
                                popularCoworking.destination,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize:
                                            AdaptSize.screenHeight * .012),
                              ),

                              SizedBox(
                                width: AdaptSize.screenHeight * .008,
                              ),

                              /// keterangan available
                              SvgPicture.asset(
                                  'assets/svg_assets/available.svg',
                                  height: AdaptSize.screenHeight * .023),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                '${popularCoworking.totalPerson}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize:
                                            AdaptSize.screenHeight * .012),
                              ),

                              SizedBox(
                                width: AdaptSize.screenHeight * .008,
                              ),

                              /// keteranganan jarak
                              SvgPicture.asset(
                                'assets/svg_assets/ruler.svg',
                                height: AdaptSize.screenHeight * .023,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                popularCoworking.distance,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize:
                                            AdaptSize.screenHeight * .012),
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
                                    .format(popularCoworking.price),
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
