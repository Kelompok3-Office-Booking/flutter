import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/widget/widget/frame_image_items.dart';
import 'package:betterspace/src/widget/widget/icon_with_label.dart';
import 'package:betterspace/src/widget/widget/item_card.dart';
import 'package:betterspace/src/widget/widget/rating_stars_widget..dart';
import 'package:betterspace/src/widget/widget/transparent_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    AdaptSize.size(context: context);
    return Scaffold(
      backgroundColor: MyColor.neutral900,
      appBar: transparentAppbarWidget(
        context: context,
        leadingIcon: IconButton(
          onPressed: () {},
          icon: Padding(
            padding: EdgeInsets.only(left: AdaptSize.pixel20),
            child: Icon(
              Icons.arrow_back,
              color: MyColor.neutral200,
              size: AdaptSize.pixel26,
            ),
          ),
        ),
        titleSpacer: AdaptSize.pixel24,
        titles: Text(
          "Wishlist",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: MyColor.neutral200),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: AdaptSize.pixel8,
            left: AdaptSize.pixel16,
            right: AdaptSize.pixel16),
        child: ListView(
          children: [
            SizedBox(
              height: AdaptSize.screenWidth / 3.3,
              width: AdaptSize.screenWidth / 1.095,
              child: itemCards(
                  cardBorderRadius: 16,
                  elevations: 4,
                  childWidgets: Row(
                    children: [
                      Stack(
                        children: [
                          imageItemFrameRounded(
                            imagePadding: EdgeInsets.only(
                              top: AdaptSize.pixel4,
                              bottom: AdaptSize.pixel4,
                              left: AdaptSize.pixel4,
                              right: AdaptSize.pixel8,
                            ),
                            itemHeight: AdaptSize.screenWidth / 3.6,
                            itemWidth: AdaptSize.screenWidth / 3.6,
                            Images: Image(
                              image: AssetImage(
                                  "assets/image_assets/space_image/space1.png"),
                              fit: BoxFit.cover,
                            ),
                            frameRadius: 16,
                          ),
                          Positioned(
                            top: AdaptSize.pixel8,
                            left: AdaptSize.pixel8,
                            child: ratingStarBadge(
                              contexts: context,
                              contentTexts: Text(
                                "0.0",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: MyColor.neutral900,
                                        fontSize: 11),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: AdaptSize.pixel4,
                          left: AdaptSize.pixel8,
                          right: AdaptSize.pixel8,
                        ),
                        child: SizedBox(
                          width: AdaptSize.screenWidth / 2.3,
                          height: AdaptSize.screenHeight / 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: AdaptSize.pixel8),
                                child: Text(
                                  "Coworking Space",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: MyColor.neutral300),
                                ),
                              ),
                              Text(
                                "Working Space Zero",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: MyColor.neutral300,
                                        fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: IconWithLabel().asrow(
                                    contexts: context,
                                    usedIcon: Icons.location_on_outlined,
                                    labelText: "Tebet, South Jakarta",
                                    spacer: AdaptSize.pixel3),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: AdaptSize.pixel17,
                            top: AdaptSize.pixel15,
                            bottom: AdaptSize.pixel75),
                        child: SizedBox(
                          height: AdaptSize.pixel18,
                          width: AdaptSize.pixel18,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.bookmark,
                              size: AdaptSize.pixel18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  cardBottomPadding: AdaptSize.pixel8),
            ),
            SizedBox(
              height: AdaptSize.screenWidth / 3.3,
              width: AdaptSize.screenWidth / 1.095,
              child: itemCards(
                  cardBorderRadius: 16,
                  elevations: 4,
                  childWidgets: Row(
                    children: [
                      Stack(
                        children: [
                          imageItemFrameRounded(
                            imagePadding: EdgeInsets.only(
                              top: AdaptSize.pixel4,
                              bottom: AdaptSize.pixel4,
                              left: AdaptSize.pixel4,
                              right: AdaptSize.pixel8,
                            ),
                            itemHeight: AdaptSize.screenWidth / 3.6,
                            itemWidth: AdaptSize.screenWidth / 3.6,
                            Images: Image(
                              image: AssetImage(
                                  "assets/image_assets/space_image/space1.png"),
                              fit: BoxFit.cover,
                            ),
                            frameRadius: 16,
                          ),
                          Positioned(
                            top: AdaptSize.pixel8,
                            left: AdaptSize.pixel8,
                            child: ratingStarBadge(
                              contexts: context,
                              contentTexts: Text(
                                "0.0",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: MyColor.neutral900,
                                        fontSize: 11),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: AdaptSize.pixel4,
                          left: AdaptSize.pixel8,
                          right: AdaptSize.pixel8,
                        ),
                        child: SizedBox(
                          width: AdaptSize.screenWidth / 2.3,
                          height: AdaptSize.screenHeight / 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: AdaptSize.pixel8),
                                child: Text(
                                  "Coworking Space",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: MyColor.neutral300),
                                ),
                              ),
                              Text(
                                "Working Space Zero",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: MyColor.neutral300,
                                        fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: IconWithLabel().asrow(
                                    contexts: context,
                                    usedIcon: Icons.location_on_outlined,
                                    labelText: "Tebet, South Jakarta",
                                    spacer: AdaptSize.pixel3),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: AdaptSize.pixel17,
                            top: AdaptSize.pixel15,
                            bottom: AdaptSize.pixel75),
                        child: SizedBox(
                          height: AdaptSize.pixel18,
                          width: AdaptSize.pixel18,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.bookmark,
                              size: AdaptSize.pixel18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  cardBottomPadding: AdaptSize.pixel8),
            ),
            SizedBox(
              height: AdaptSize.screenWidth / 3.3,
              width: AdaptSize.screenWidth / 1.095,
              child: itemCards(
                  cardBorderRadius: 16,
                  elevations: 4,
                  childWidgets: Row(
                    children: [
                      Stack(
                        children: [
                          imageItemFrameRounded(
                            imagePadding: EdgeInsets.only(
                              top: AdaptSize.pixel4,
                              bottom: AdaptSize.pixel4,
                              left: AdaptSize.pixel4,
                              right: AdaptSize.pixel8,
                            ),
                            itemHeight: AdaptSize.screenWidth / 3.6,
                            itemWidth: AdaptSize.screenWidth / 3.6,
                            Images: Image(
                              image: AssetImage(
                                  "assets/image_assets/space_image/space1.png"),
                              fit: BoxFit.cover,
                            ),
                            frameRadius: 16,
                          ),
                          Positioned(
                            top: AdaptSize.pixel8,
                            left: AdaptSize.pixel8,
                            child: ratingStarBadge(
                              contexts: context,
                              contentTexts: Text(
                                "0.0",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: MyColor.neutral900,
                                        fontSize: 11),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: AdaptSize.pixel4,
                          left: AdaptSize.pixel8,
                          right: AdaptSize.pixel8,
                        ),
                        child: SizedBox(
                          width: AdaptSize.screenWidth / 2.3,
                          height: AdaptSize.screenHeight / 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: AdaptSize.pixel8),
                                child: Text(
                                  "Coworking Space",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: MyColor.neutral300),
                                ),
                              ),
                              Text(
                                "Working Space Zero",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: MyColor.neutral300,
                                        fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: IconWithLabel().asrow(
                                    contexts: context,
                                    usedIcon: Icons.location_on_outlined,
                                    labelText: "Tebet, South Jakarta",
                                    spacer: AdaptSize.pixel3),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: AdaptSize.pixel17,
                            top: AdaptSize.pixel15,
                            bottom: AdaptSize.pixel75),
                        child: SizedBox(
                          height: AdaptSize.pixel18,
                          width: AdaptSize.pixel18,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.bookmark,
                              size: AdaptSize.pixel18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  cardBottomPadding: AdaptSize.pixel8),
            ),
            SizedBox(
              height: AdaptSize.screenWidth / 3.3,
              width: AdaptSize.screenWidth / 1.095,
              child: itemCards(
                  cardBorderRadius: 16,
                  elevations: 4,
                  childWidgets: Row(
                    children: [
                      Stack(
                        children: [
                          imageItemFrameRounded(
                            imagePadding: EdgeInsets.only(
                              top: AdaptSize.pixel4,
                              bottom: AdaptSize.pixel4,
                              left: AdaptSize.pixel4,
                              right: AdaptSize.pixel8,
                            ),
                            itemHeight: AdaptSize.screenWidth / 3.6,
                            itemWidth: AdaptSize.screenWidth / 3.6,
                            Images: Image(
                              image: AssetImage(
                                  "assets/image_assets/space_image/space1.png"),
                              fit: BoxFit.cover,
                            ),
                            frameRadius: 16,
                          ),
                          Positioned(
                            top: AdaptSize.pixel8,
                            left: AdaptSize.pixel8,
                            child: ratingStarBadge(
                              contexts: context,
                              contentTexts: Text(
                                "0.0",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: MyColor.neutral900,
                                        fontSize: 11),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: AdaptSize.pixel4,
                          left: AdaptSize.pixel8,
                          right: AdaptSize.pixel8,
                        ),
                        child: SizedBox(
                          width: AdaptSize.screenWidth / 2.3,
                          height: AdaptSize.screenHeight / 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: AdaptSize.pixel8),
                                child: Text(
                                  "Coworking Space",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: MyColor.neutral300),
                                ),
                              ),
                              Text(
                                "Working Space Zero",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: MyColor.neutral300,
                                        fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: IconWithLabel().asrow(
                                    contexts: context,
                                    usedIcon: Icons.location_on_outlined,
                                    labelText: "Tebet, South Jakarta",
                                    spacer: AdaptSize.pixel3),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: AdaptSize.pixel17,
                            top: AdaptSize.pixel15,
                            bottom: AdaptSize.pixel75),
                        child: SizedBox(
                          height: AdaptSize.pixel18,
                          width: AdaptSize.pixel18,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.bookmark,
                              size: AdaptSize.pixel18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  cardBottomPadding: AdaptSize.pixel8),
            ),
            SizedBox(
              height: AdaptSize.screenWidth / 3.33333333,
              width: AdaptSize.screenWidth / 1.095,
              child: itemCards(
                cardBorderRadius: 16,
                elevations: 4,
                cardBottomPadding: AdaptSize.pixel8,
                childWidgets: SizedBox(
                  height: AdaptSize.screenWidth / 3.91304347826,
                  width: AdaptSize.screenWidth / 1.15384615385,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: AdaptSize.pixel6,
                            top: AdaptSize.pixel6,
                            left: AdaptSize.pixel8),
                        child: SizedBox(
                          width: AdaptSize.screenWidth / 1.15384615385,
                          child: Text(
                            "Are You Sure To Remove This Item From The Wishlist",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: AdaptSize.pixel6, right: AdaptSize.pixel8),
                        child: SizedBox(
                          width: AdaptSize.screenWidth / 1.15385,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(right: AdaptSize.pixel8),
                                child: SizedBox(
                                  height: AdaptSize.screenWidth / 9,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                        elevation: 0,
                                        backgroundColor: MyColor.danger400),
                                    onPressed: () {},
                                    child: Text(
                                      "Cancel",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: MyColor.neutral900),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: AdaptSize.screenWidth / 9,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      side: BorderSide(
                                          width: 2.0,
                                          color: MyColor.neutral400),
                                      elevation: 0,
                                      backgroundColor: MyColor.transparanColor),
                                  onPressed: () {},
                                  child: Text(
                                    "Delete",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: MyColor.neutral400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
