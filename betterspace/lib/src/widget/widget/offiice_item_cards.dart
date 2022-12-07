import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/widget/widget/frame_image_items.dart';
import 'package:betterspace/src/widget/widget/icon_with_label.dart';
import 'package:betterspace/src/widget/widget/item_card.dart';
import 'package:betterspace/src/widget/widget/transaction_status_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget officeItemCards({
  required BuildContext contexts,
  String? contentTitle,
  String? contentTexts,
  double? cardBottomPaddings,
  double? cardParentBorderRadius,
  ImageProvider<Object>? contentImage,
}) {
  AdaptSize.size(context: contexts);
  return SizedBox(
    height: AdaptSize.screenWidth / 2.571429,
    child: itemCards(
      cardBottomPadding: cardBottomPaddings ?? AdaptSize.pixel8,
      cardBorderRadius: cardBottomPaddings ?? 16,
      childWidgets: SizedBox(
        width: AdaptSize.screenWidth / 1.125,
        height: AdaptSize.screenWidth / 2.72727273,
        child: Row(
          children: [
            imageItemFrameRounded(
              itemHeight: AdaptSize.screenWidth / 2.72727273,
              itemWidth: AdaptSize.screenWidth / 2.72727273,
              Images: Image(
                image: contentImage ??
                    AssetImage("assets/image_assets/space_image/space1.png"),
                fit: BoxFit.cover,
              ),
              frameRadius: 16,
              imagePadding: EdgeInsets.only(
                top: AdaptSize.pixel4,
                bottom: AdaptSize.pixel4,
                left: AdaptSize.pixel4,
                right: AdaptSize.pixel8,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: AdaptSize.pixel8,
                bottom: AdaptSize.pixel6,
                right: AdaptSize.pixel10,
              ),
              child: SizedBox(
                height: AdaptSize.screenWidth / 2.7692307,
                width: AdaptSize.screenWidth / 2.155698,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contentTitle ?? "content title",
                      style: Theme.of(contexts).textTheme.bodyMedium!.copyWith(
                          color: MyColor.neutral100,
                          fontSize: AdaptSize.screenHeight / 1000 * 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(child: SizedBox()),
                    Padding(
                      padding: EdgeInsets.only(bottom: AdaptSize.pixel6),
                      child: Text(
                        "content text, content text",
                        style:
                            Theme.of(contexts).textTheme.bodyMedium!.copyWith(
                                  color: MyColor.neutral100,
                                  fontSize: AdaptSize.screenHeight / 1000 * 14,
                                ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: AdaptSize.pixel6),
                      child: SizedBox(
                        height: AdaptSize.pixel24,
                        child: Row(
                          children: [
                            IconWithLabel().asrow(
                              contexts: contexts,
                              usedIcon: Icons.location_on_outlined,
                              labelText: "12 Km",
                            ),
                            IconWithLabel().asrow(
                              contexts: contexts,
                              usedIcon: Icons.location_on_outlined,
                              labelText: "12 Km",
                            ),
                            IconWithLabel().asrow(
                              contexts: contexts,
                              usedIcon: Icons.location_on_outlined,
                              labelText: "12 Km",
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: AdaptSize.screenWidth / 5.2173913,
                      height: AdaptSize.pixel22,
                      child: transactionStatusWidget(
                          contexts: contexts,
                          statusText: "Coworking",
                          statusBodyColor: MyColor.neutral900,
                          statusBorderColor: MyColor.primary700,
                          statusTextColor: MyColor.primary700),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
