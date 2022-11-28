import 'package:betterspace/src/model/data/map_space_data.dart';
import 'package:betterspace/src/model/map_space_model.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/material.dart';

Widget searchMapWidget(){
  return SizedBox(
    height: AdaptSize.screenHeight * 0.193,
    width: double.infinity,
    child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: mapSpace.length,
        itemBuilder: (context, index) {
          final MapSpaceModel mapSpaces = mapSpace[index];
          return Container(
            margin: EdgeInsets.all(AdaptSize.screenHeight * 0.005),
            decoration: BoxDecoration(
                color: MyColor.netralColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(1, 2),
                    color: MyColor.grayLightColor.withOpacity(.4),
                    blurRadius: 3,
                  ),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    fit: FlexFit.tight,
                    child: Image.asset(mapSpaces.mapImage)),
                Padding(
                  padding: EdgeInsets.all(
                    AdaptSize.screenHeight * 0.008,
                  ),
                  child: Text(
                    mapSpaces.location,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(
                      fontSize: AdaptSize.screenHeight * 0.016,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
  );
}