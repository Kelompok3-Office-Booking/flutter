import 'dart:ffi';

import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/widget/widget/bottom_card.dart';
import 'package:betterspace/src/widget/widget/default_appbar_widget.dart';
import 'package:betterspace/src/widget/widget/frame_image_items.dart';
import 'package:betterspace/src/widget/widget/icon_with_label.dart';
import 'package:betterspace/src/widget/widget/item_card.dart';
import 'package:betterspace/src/widget/widget/transaction_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailOrderScreens extends StatefulWidget {
  const DetailOrderScreens({super.key});

  @override
  State<DetailOrderScreens> createState() => _DetailOrderScreensState();
}

class _DetailOrderScreensState extends State<DetailOrderScreens> {
  @override
  Widget build(BuildContext context) {
    AdaptSize.size(context: context);
    return Scaffold(
      appBar: defaultAppbarWidget(
        titles: "Detail Order",
        contexts: context,
      ),
      body: SizedBox(
        height: AdaptSize.screenHeight,
        width: AdaptSize.screenWidth,
        child: Column(
          children: [
            Flexible(
              flex: 842,
              child: Padding(
                padding: EdgeInsets.only(
                    top: AdaptSize.pixel8,
                    right: AdaptSize.pixel16,
                    left: AdaptSize.pixel16),
                child: SizedBox(
                  width: AdaptSize.screenWidth / 1.097561,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: AdaptSize.pixel24,
                        child: Row(
                          children: [
                            Text(
                              "Status",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: MyColor.neutral100,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          AdaptSize.screenHeight / 1000 * 18),
                            ),
                            Spacer(),
                            transactionStatusWidget(
                                contexts: context,
                                statusText: "Accepted",
                                statusBodyColor: MyColor.success700,
                                statusBorderColor: MyColor.success400,
                                statusTextColor: MyColor.success400),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AdaptSize.screenWidth / 2.571429,
                        child: itemCards(
                          cardBottomPadding: AdaptSize.pixel8,
                          cardBorderRadius: 16,
                          childWidgets: SizedBox(
                            width: AdaptSize.screenWidth / 1.125,
                            height: AdaptSize.screenWidth / 2.72727273,
                            child: Row(
                              children: [
                                imageItemFrameRounded(
                                  itemHeight:
                                      AdaptSize.screenWidth / 2.72727273,
                                  itemWidth: AdaptSize.screenWidth / 2.72727273,
                                  Images: Image(
                                    image: AssetImage(
                                        "assets/image_assets/space_image/space1.png"),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Working Space Zero",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color: MyColor.neutral100,
                                                  fontSize:
                                                      AdaptSize.screenHeight /
                                                          1000 *
                                                          18,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        Expanded(child: SizedBox()),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom: AdaptSize.pixel6),
                                          child: Text(
                                            "Kelapa gading, North Jakarta",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  color: MyColor.neutral100,
                                                  fontSize:
                                                      AdaptSize.screenHeight /
                                                          1000 *
                                                          14,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom: AdaptSize.pixel6),
                                          child: SizedBox(
                                            height: AdaptSize.pixel24,
                                            child: Row(
                                              children: [
                                                IconWithLabel().asrow(
                                                  contexts: context,
                                                  usedIcon: Icons
                                                      .location_on_outlined,
                                                  labelText: "12 Km",
                                                ),
                                                IconWithLabel().asrow(
                                                  contexts: context,
                                                  usedIcon: Icons
                                                      .location_on_outlined,
                                                  labelText: "12 Km",
                                                ),
                                                IconWithLabel().asrow(
                                                  contexts: context,
                                                  usedIcon: Icons
                                                      .location_on_outlined,
                                                  labelText: "12 Km",
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                              AdaptSize.screenWidth / 5.2173913,
                                          height: AdaptSize.pixel22,
                                          child: transactionStatusWidget(
                                              contexts: context,
                                              statusText: "Coworking",
                                              statusBodyColor:
                                                  MyColor.neutral900,
                                              statusBorderColor:
                                                  MyColor.primary700,
                                              statusTextColor:
                                                  MyColor.primary700),
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
                      SizedBox(
                        height: AdaptSize.screenWidth / 2.21,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: AdaptSize.pixel16),
                              child: Text(
                                "Reservation Detail",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: MyColor.neutral100,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            AdaptSize.screenHeight / 1000 * 18),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: AdaptSize.pixel8),
                              child: SizedBox(
                                height: AdaptSize.pixel24,
                                child: IconWithLabel().asrow(
                                  iconColor: MyColor.secondary400,
                                  spacer: AdaptSize.pixel16,
                                  contexts: context,
                                  usedIcon: Icons.account_circle_outlined,
                                  labelText: "Fadli Rahmadan",
                                  iconSize: AdaptSize.pixel24,
                                  fontSizes: AdaptSize.screenHeight / 1000 * 18,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: AdaptSize.pixel8),
                              child: SizedBox(
                                height: AdaptSize.pixel24,
                                child: IconWithLabel().asrow(
                                  iconColor: MyColor.secondary400,
                                  spacer: AdaptSize.pixel16,
                                  contexts: context,
                                  usedIcon: Icons.calendar_month_outlined,
                                  labelText: "Sunday, 21 February 2022",
                                  iconSize: AdaptSize.pixel24,
                                  fontSizes: AdaptSize.screenHeight / 1000 * 18,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: AdaptSize.pixel8),
                              child: SizedBox(
                                height: AdaptSize.pixel24,
                                child: IconWithLabel().asrow(
                                  iconColor: MyColor.secondary400,
                                  spacer: AdaptSize.pixel16,
                                  contexts: context,
                                  usedIcon: Icons.access_time_outlined,
                                  labelText: "09:00",
                                  iconSize: AdaptSize.pixel24,
                                  fontSizes: AdaptSize.screenHeight / 1000 * 18,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: AdaptSize.pixel8),
                              child: SizedBox(
                                height: AdaptSize.pixel24,
                                child: IconWithLabel().asrow(
                                  iconColor: MyColor.secondary400,
                                  spacer: AdaptSize.pixel16,
                                  contexts: context,
                                  usedIcon: Icons.emoji_food_beverage_outlined,
                                  labelText: "Iced Lemon Tea",
                                  iconSize: AdaptSize.pixel24,
                                  fontSizes: AdaptSize.screenHeight / 1000 * 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: AdaptSize.screenWidth / 1.097561,
                        height: AdaptSize.pixel2,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: MyColor.neutral800),
                        ),
                      ),
                      SizedBox(
                        height: AdaptSize.screenWidth / 1.2342,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: AdaptSize.pixel16),
                              child: Text(
                                "Reservation Detail",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: MyColor.neutral100,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            AdaptSize.screenHeight / 1000 * 18),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: AdaptSize.pixel18),
                              child: SizedBox(
                                height: AdaptSize.pixel26,
                                child: Row(
                                  children: [
                                    Text(
                                      "Payment Method",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: MyColor.neutral100,
                                              fontSize: AdaptSize.screenHeight /
                                                  1000 *
                                                  16),
                                    ),
                                    Spacer(),
                                    Text(
                                      "/placeholder/",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: MyColor.neutral100,
                                              fontWeight: FontWeight.bold,
                                              fontSize: AdaptSize.screenHeight /
                                                  1000 *
                                                  16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: AdaptSize.pixel8),
                              child: SizedBox(
                                height: AdaptSize.pixel26,
                                child: Row(
                                  children: [
                                    Text(
                                      "Total Price",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: MyColor.neutral100,
                                              fontWeight: FontWeight.bold,
                                              fontSize: AdaptSize.screenHeight /
                                                  1000 *
                                                  16),
                                    ),
                                    Spacer(),
                                    Text(
                                      "Rp. 243.000.00",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: MyColor.neutral100,
                                              fontWeight: FontWeight.bold,
                                              fontSize: AdaptSize.screenHeight /
                                                  1000 *
                                                  16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: AdaptSize.pixel8),
                              child: SizedBox(
                                height: AdaptSize.pixel26,
                                child: Row(
                                  children: [
                                    Text(
                                      "Price/Hour",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: MyColor.neutral100,
                                              fontSize: AdaptSize.screenHeight /
                                                  1000 *
                                                  16),
                                    ),
                                    Spacer(),
                                    Text(
                                      "Rp. 35.000.00",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: MyColor.neutral100,
                                              fontWeight: FontWeight.bold,
                                              fontSize: AdaptSize.screenHeight /
                                                  1000 *
                                                  16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: AdaptSize.pixel8),
                              child: SizedBox(
                                height: AdaptSize.pixel26,
                                child: Row(
                                  children: [
                                    Text(
                                      "Duration",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: MyColor.neutral100,
                                              fontSize: AdaptSize.screenHeight /
                                                  1000 *
                                                  16),
                                    ),
                                    Spacer(),
                                    Text(
                                      "x6 Hour",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: MyColor.neutral100,
                                              fontWeight: FontWeight.bold,
                                              fontSize: AdaptSize.screenHeight /
                                                  1000 *
                                                  16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: AdaptSize.pixel8),
                              child: SizedBox(
                                height: AdaptSize.pixel26,
                                child: Row(
                                  children: [
                                    Text(
                                      "Service",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: MyColor.neutral100,
                                              fontSize: AdaptSize.screenHeight /
                                                  1000 *
                                                  16),
                                    ),
                                    Spacer(),
                                    Text(
                                      "Rp. 10.000.00",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: MyColor.neutral100,
                                              fontWeight: FontWeight.bold,
                                              fontSize: AdaptSize.screenHeight /
                                                  1000 *
                                                  16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: AdaptSize.pixel8),
                              child: SizedBox(
                                width: AdaptSize.screenWidth / 1.097561,
                                height: AdaptSize.pixel2,
                                child: DecoratedBox(
                                  decoration:
                                      BoxDecoration(color: MyColor.neutral800),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: AdaptSize.pixel8),
                              child: SizedBox(
                                height: AdaptSize.pixel26,
                                child: Row(
                                  children: [
                                    Text(
                                      "Total",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: MyColor.neutral100,
                                              fontSize: AdaptSize.screenHeight /
                                                  1000 *
                                                  16),
                                    ),
                                    Spacer(),
                                    Text(
                                      "Rp. 220.000.00",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: MyColor.neutral100,
                                              fontWeight: FontWeight.bold,
                                              fontSize: AdaptSize.screenHeight /
                                                  1000 *
                                                  16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: AdaptSize.pixel8),
                              child: SizedBox(
                                height: AdaptSize.pixel26,
                                child: Row(
                                  children: [
                                    Text(
                                      "PPN(11%)",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: MyColor.neutral100,
                                              fontSize: AdaptSize.screenHeight /
                                                  1000 *
                                                  16),
                                    ),
                                    Spacer(),
                                    Text(
                                      "Rp. 23.000.00",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: MyColor.neutral100,
                                              fontWeight: FontWeight.bold,
                                              fontSize: AdaptSize.screenHeight /
                                                  1000 *
                                                  16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 114,
              child: SizedBox(
                width: AdaptSize.screenWidth,
                child: partialRoundedCard(
                    childWidgets: Column(),
                    cardBottomPadding: 0,
                    cardTopLeftRadius: 8,
                    cardTopRightRadius: 8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}