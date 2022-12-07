import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget defaultAppbarWidget({
  String? titles,
  required BuildContext contexts,
  List<Widget>? actionWidget,
  Function? leadIconFunction,
}) {
  AdaptSize.size(context: contexts);
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(4.0),
      child: Container(
        color: MyColor.neutral800,
        height: 2.0,
      ),
    ),
    backgroundColor: MyColor.neutral900,
    elevation: 0,
    titleSpacing: AdaptSize.pixel16,
    leading: IconButton(
      onPressed: () {
        leadIconFunction;
      },
      icon: Padding(
        padding: EdgeInsets.only(left: AdaptSize.pixel20),
        child: Icon(
          Icons.arrow_back,
          color: MyColor.neutral200,
          size: AdaptSize.pixel26,
        ),
      ),
    ),
    title: Text(
      titles ?? "",
      style: Theme.of(contexts).textTheme.headline5!.copyWith(
          color: MyColor.neutral100,
          fontSize: AdaptSize.screenHeight / 1000 * 24),
    ),
    actions: actionWidget,
  );
}
