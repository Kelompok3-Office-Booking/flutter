import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/widget/widget/rich_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDialog {
  /// double action
  static Future doubleActionDialog({
    context,
    required String title,
    required String imageAsset,
    Function()? onTap1,
    Function()? onTap2,
  }) {
    return showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: Column(
              children: [
                SvgPicture.asset(
                  imageAsset,
                  height: AdaptSize.screenHeight * .035,
                  width: AdaptSize.screenWidth * .035,
                ),

                SizedBox(
                  height: AdaptSize.screenHeight * .01,
                ),

                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: AdaptSize.screenHeight * .016),
                ),
                SizedBox(
                  height: AdaptSize.screenHeight * .016,
                ),

                /// button oke
                dialogButton(
                  text: 'Yes, I Sure',
                  context: context,
                  side: BorderSide(
                    color: MyColor.neutral500,
                  ),
                  onPressed: onTap1,
                  backGroundColor: MyColor.neutral700,
                  textColor: MyColor.neutral500,
                ),

                SizedBox(
                  height: AdaptSize.screenHeight * .008,
                ),

                /// button batal keluar
                dialogButton(
                  text: 'No, not sure yet',
                  context: context,
                  onPressed: onTap2,
                  backGroundColor: MyColor.danger400,
                  textColor: MyColor.neutral900,
                ),
              ],
            ),
          );
        });
  }

  static Future singleActionDialog({
    context,
    required String imageAsset,
    required String title,
    required Function()? onPressed,
  }) {
    return showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: Column(
              children: [
                SvgPicture.asset(
                  imageAsset,
                  height: AdaptSize.screenHeight * .056,
                  width: AdaptSize.screenWidth * .056,
                ),
                SizedBox(
                  height: AdaptSize.screenHeight * .008,
                ),
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: AdaptSize.screenHeight * .016),
                ),
                SizedBox(
                  height: AdaptSize.screenHeight * .022,
                ),

                /// oke
                ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    //side: side,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize:
                        Size(double.infinity, AdaptSize.screenHeight * .048),
                    backgroundColor: MyColor.darkBlueColor,
                    elevation: 0,
                  ),
                  child: Text(
                    'Oke',
                    style: Theme.of(context).textTheme.button!.copyWith(
                        color: MyColor.neutral900,
                        fontSize: AdaptSize.screenHeight * .016),
                  ),
                ),
              ],
            ),
          );
        });
  }

  static Future singleActionDialogWithoutImage({
    context,
    String? text1,
    String? text2,
    String? text3,
    required bool withTextRich,
    required String title,
    required Function()? onPressed,
  }) {
    return showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  withTextRich
                      ? richTextWidget(
                          text1: text1,
                          textStyle1: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  fontSize: AdaptSize.screenHeight * .016),
                          text2: text2,
                          textStyle2: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontSize: AdaptSize.screenHeight * .016),
                          text3: text3,
                          textStyle3: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  fontSize: AdaptSize.screenHeight * .016),
                        )
                      : Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: AdaptSize.screenHeight * .016),
                        ),
                  SizedBox(
                    height: AdaptSize.screenHeight * .022,
                  ),

                  /// oke
                  ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      //side: side,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize:
                          Size(double.infinity, AdaptSize.screenHeight * .048),
                      backgroundColor: MyColor.darkBlueColor,
                      elevation: 0,
                    ),
                    child: Text(
                      'Oke',
                      style: Theme.of(context).textTheme.button!.copyWith(
                          color: MyColor.neutral900,
                          fontSize: AdaptSize.screenHeight * .016),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  static Widget dialogButton({
    context,
    Function()? onPressed,
    Color? backGroundColor,
    BorderSide? side,
    required Color textColor,
    required String text,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: side,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: Size(double.infinity, AdaptSize.screenHeight * .048),
        backgroundColor: backGroundColor,
        elevation: 0,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.button!.copyWith(
            color: textColor, fontSize: AdaptSize.screenHeight * .016),
      ),
    );
  }
}
