import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/utils/hex_color_convert.dart';
import 'package:flutter/material.dart';

/// card review
Widget cardReview({
  context,
  required String userImage,
  required String userNameReview,
  required String dateReview,
  required String descriptionReview,
  required int totalHelpful,
  Function()? buttonHelpful,
}) {
  return Container(
    width: AdaptSize.screenWidth / 1000 * 840,
    padding: EdgeInsets.all(AdaptSize.screenHeight * .01),
    margin: EdgeInsets.all(AdaptSize.pixel4),
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
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                userImage,
              ),
            ),

            SizedBox(
              width: AdaptSize.screenWidth * .008,
            ),

            /// user name & date post
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AdaptSize.screenHeight * .004,
                  ),
                  Row(
                    children: [
                      ///name
                      Flexible(
                        fit: FlexFit.loose,
                        child: Text(
                          '$userNameReview ',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: AdaptSize.pixel14),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),

                      Icon(
                        Icons.brightness_1,
                        size: AdaptSize.pixel4,
                        color: MyColor.neutral600,
                      ),

                      /// date post
                      Text(
                        dateReview,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: AdaptSize.pixel14,
                              color: MyColor.neutral600,
                            ),
                        maxLines: 1,
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
              ),
            )
          ],
        ),

        SizedBox(
          height: AdaptSize.pixel10,
        ),

        /// description
        Text(
          descriptionReview,
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
                onTap: buttonHelpful,
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
                'Helpfull ($totalHelpful)',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontSize: AdaptSize.pixel10),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
