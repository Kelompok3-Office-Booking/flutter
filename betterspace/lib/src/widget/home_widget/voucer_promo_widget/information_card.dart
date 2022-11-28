import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/material.dart';

Widget cardInformationVoucer({
  context,
  String? image,
  String? textTitle,
  String? descriptions,
  Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(16),
    child: Card(
      color: MyColor.netralColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      shadowColor: MyColor.grayLightColor.withOpacity(.6),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(AdaptSize.screenWidth * .010),
        child: Row(
          children: [
            Image.asset(image!),
            SizedBox(
              width: AdaptSize.screenWidth * .04,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textTitle!,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: AdaptSize.screenHeight * .016),
                  ),
                  SizedBox(
                    height: AdaptSize.screenHeight * .005,
                  ),
                  Text(
                    descriptions!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: AdaptSize.screenHeight * .013),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}