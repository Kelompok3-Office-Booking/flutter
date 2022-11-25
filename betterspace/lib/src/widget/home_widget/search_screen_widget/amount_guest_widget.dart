import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/material.dart';

Widget amountGuestWidget(
    context,
    Function()? onTap,
    String text1,
    String text2,
    ){
  return Container(
    height: AdaptSize.screenHeight * .07,
    width: double.infinity,
    margin: EdgeInsets.only(
      left: AdaptSize.screenWidth * .025,
      right: AdaptSize.screenWidth * .025,
      bottom: AdaptSize.screenHeight * .024,
    ),
    decoration: BoxDecoration(
      color: MyColor.whiteColor,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: MyColor.darkBlueColor,
      ),
    ),
    child: InkWell(
      onTap: onTap,
      child: Row(
        children: [
          const Spacer(),
          Text(
            text1,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
              color: MyColor.darkBlueColor,
              fontSize: AdaptSize.screenHeight * .016,
            ),
          ),
          SizedBox(
            width: AdaptSize.screenHeight * .008,
          ),
          Icon(
            Icons.person_outline,
            color: MyColor.darkBlueColor,
            size: AdaptSize.screenHeight * .025,
          ),
          Text(
            text2,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
              color: MyColor.darkBlueColor,
              fontSize: AdaptSize.screenHeight * .016,
            ),
          ),
          const Spacer(),
        ],
      ),
    ),
  );
}