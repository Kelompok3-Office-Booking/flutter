import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future showExitDialog(BuildContext context) {
  return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: Text(
            'Are you sure want to exit ?',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text(
                'Cancel',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: MyColor.darkBlueColor),
              ),
            ),
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(
                'Exit',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: MyColor.redColor),
              ),
            ),
          ],
        );
      });
}
