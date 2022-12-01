import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/widget/widget/icon_with_label.dart';
import 'package:betterspace/src/widget/widget/rich_text_widget.dart';
import 'package:betterspace/src/widget/widget/transparent_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OfficeDetailScreen extends StatefulWidget {
  const OfficeDetailScreen({super.key});

  @override
  State<OfficeDetailScreen> createState() => _OfficeDetailScreenState();
}

class _OfficeDetailScreenState extends State<OfficeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    AdaptSize.size(context: context);
    return Scaffold(
      appBar: transparentAppbarWidget(
        context: context,
        leadingIcon: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: MyColor.danger100,
          ),
        ),
        actionIcon: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bookmark,
                color: MyColor.danger100,
              ))
        ],
      ),
      body: Padding(
        padding:
            EdgeInsets.only(right: AdaptSize.pixel16, left: AdaptSize.pixel16),
        child: SizedBox(
          height: AdaptSize.screenHeight,
          width: AdaptSize.screenWidth,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: AdaptSize.pixel18),
                child: SizedBox(
                  height: ((AdaptSize.screenWidth / 1.097) * 1.2),
                  width: AdaptSize.screenWidth / 1.097,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: AdaptSize.pixel8),
                        child: SizedBox(
                          height: AdaptSize.screenWidth / 1.3,
                          width: AdaptSize.screenWidth / 1.097,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image(
                              image: AssetImage(
                                  "assets/image_assets/space_image/space1.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: AdaptSize.screenWidth / 3.5,
                          width: AdaptSize.screenWidth / 1.097,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(right: AdaptSize.pixel8),
                                child: SizedBox(
                                  height: AdaptSize.screenWidth / 3.5,
                                  width: AdaptSize.screenWidth / 3.5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image(
                                      image: AssetImage(
                                          "assets/image_assets/space_image/space1.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: AdaptSize.pixel8),
                                child: SizedBox(
                                  height: AdaptSize.screenWidth / 3.5,
                                  width: AdaptSize.screenWidth / 3.5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image(
                                      image: AssetImage(
                                          "assets/image_assets/space_image/space1.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: AdaptSize.pixel8),
                                child: SizedBox(
                                  height: AdaptSize.screenWidth / 3.5,
                                  width: AdaptSize.screenWidth / 3.5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image(
                                      image: AssetImage(
                                          "assets/image_assets/space_image/space1.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: AdaptSize.pixel8),
                                child: SizedBox(
                                  height: AdaptSize.screenWidth / 3.5,
                                  width: AdaptSize.screenWidth / 3.5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image(
                                      image: AssetImage(
                                          "assets/image_assets/space_image/space1.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: AdaptSize.pixel8),
                child: SizedBox(
                  height: AdaptSize.screenWidth / 4,
                  width: AdaptSize.screenWidth / 1.097,
                  child: Column(
                    children: [
                      SizedBox(
                        height: AdaptSize.screenWidth / 12.9,
                        child: Row(
                          children: [
                            Text(
                              "Working Space Zero",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Spacer(),
                            SizedBox(
                                width: AdaptSize.screenWidth / 7.2,
                                height: AdaptSize.screenWidth / 15,
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      width: AdaptSize.screenWidth / 4,
                                      height: AdaptSize.screenHeight / 33.3,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                            color: MyColor.neutral300,
                                            border: Border.all(
                                                width: 1,
                                                color: MyColor.neutral300),
                                            borderRadius:
                                                BorderRadius.circular(42)),
                                      ),
                                    ),
                                    Positioned(
                                      top: AdaptSize.pixel4,
                                      bottom: AdaptSize.pixel4,
                                      right: AdaptSize.pixel8,
                                      left: AdaptSize.pixel6,
                                      child: SizedBox(
                                        height: AdaptSize.pixel16,
                                        width: AdaptSize.pixel34,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star_rounded,
                                              color: MyColor.starYellow,
                                              size: AdaptSize.pixel16,
                                            ),
                                            Spacer(),
                                            Text(
                                              "0.0",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                      color: MyColor.neutral900,
                                                      fontSize: 11),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: AdaptSize.pixel10),
                        child: SizedBox(
                          height: AdaptSize.pixel20,
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: AdaptSize.pixel4,
                                ),
                                child: Icon(
                                  Icons.domain,
                                  color: MyColor.neutral100,
                                  size: 24,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: AdaptSize.pixel5),
                                child: Text(
                                  "Tebet, South Jakarta",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: MyColor.neutral100),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: AdaptSize.screenWidth / 1.097,
                        height: AdaptSize.pixel28,
                        child: Row(
                          children: [
                            IconWithLabel().asrow(
                                usedIcon: Icon(Icons.location_on_outlined),
                                labelText: Text("50m",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: MyColor.neutral100,
                                        )),
                                spacer: AdaptSize.pixel4),
                            Spacer(),
                            IconWithLabel().asrow(
                                usedIcon: Icon(Icons.location_on_outlined),
                                labelText: Text("10m2",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: MyColor.neutral100,
                                        )),
                                spacer: AdaptSize.pixel4),
                            Spacer(),
                            IconWithLabel().asrow(
                                usedIcon: Icon(Icons.person_outline),
                                labelText: Text("350",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: MyColor.neutral100,
                                        )),
                                spacer: AdaptSize.pixel4),
                            Spacer(),
                            IconWithLabel().asrow(
                                usedIcon: Icon(Icons.access_time),
                                labelText: Text("08:00-11:00",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: MyColor.neutral100,
                                        )),
                                spacer: AdaptSize.pixel4),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: AdaptSize.pixel18),
                child: SizedBox(
                  height: AdaptSize.screenWidth / 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: MyColor.neutral100,
                            fontSize: AdaptSize.dynamicBodyTextMedium,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Text(
                          "Genius Idea is one of the largest coworking spaces with a strategic location in Semarang. Services available in this coworking space include private offices, flexible desks, virtual offices to event spaces and kitchen labs.",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: MyColor.neutral200),
                          overflow: TextOverflow.visible,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: AdaptSize.screenWidth / 1.097,
                child: Container(
                  constraints: BoxConstraints(
                      minHeight: AdaptSize.screenWidth / 6.5,
                      maxHeight: AdaptSize.screenWidth / 2.4),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: AdaptSize.pixel8),
                        child: SizedBox(
                          height: AdaptSize.pixel20,
                          width: AdaptSize.screenWidth / 1.097,
                          child: Text(
                            "Capacity",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: MyColor.neutral100,
                                    fontSize: AdaptSize.dynamicBodyTextMedium,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: AdaptSize.screenWidth / 1.097,
                          child: ListView(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: AdaptSize.pixel8),
                                child: SizedBox(
                                  height: AdaptSize.pixel24,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: AdaptSize.pixel8),
                                        child: Icon(
                                          CupertinoIcons
                                              .rectangle_arrow_up_right_arrow_down_left,
                                          color: MyColor.secondary400,
                                          size: AdaptSize.pixel20,
                                        ),
                                      ),
                                      Text(
                                        "Can Accomodate",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                color: MyColor.neutral200),
                                      ),
                                      Spacer(),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "120",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      color:
                                                          MyColor.secondary400,
                                                      fontSize:
                                                          AdaptSize.pixel16),
                                            ),
                                            TextSpan(
                                                text: "person",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                        color:
                                                            MyColor.neutral200))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: AdaptSize.pixel8),
                                child: SizedBox(
                                  height: AdaptSize.pixel24,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: AdaptSize.pixel8),
                                        child: Icon(
                                          CupertinoIcons
                                              .rectangle_arrow_up_right_arrow_down_left,
                                          color: MyColor.secondary400,
                                          size: AdaptSize.pixel20,
                                        ),
                                      ),
                                      Text(
                                        "Can Accomodate",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                color: MyColor.neutral200),
                                      ),
                                      Spacer(),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "120",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      color:
                                                          MyColor.secondary400,
                                                      fontSize:
                                                          AdaptSize.pixel16),
                                            ),
                                            TextSpan(
                                                text: "person",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                        color:
                                                            MyColor.neutral200))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: AdaptSize.pixel8),
                                child: SizedBox(
                                  height: AdaptSize.pixel24,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: AdaptSize.pixel8),
                                        child: Icon(
                                          CupertinoIcons
                                              .rectangle_arrow_up_right_arrow_down_left,
                                          color: MyColor.secondary400,
                                          size: AdaptSize.pixel20,
                                        ),
                                      ),
                                      Text(
                                        "Can Accomodate",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                color: MyColor.neutral200),
                                      ),
                                      Spacer(),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "120",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      color:
                                                          MyColor.secondary400,
                                                      fontSize:
                                                          AdaptSize.pixel16),
                                            ),
                                            TextSpan(
                                                text: "person",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                        color:
                                                            MyColor.neutral200))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: AdaptSize.pixel8),
                                child: SizedBox(
                                  height: AdaptSize.pixel24,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: AdaptSize.pixel8),
                                        child: Icon(
                                          CupertinoIcons
                                              .rectangle_arrow_up_right_arrow_down_left,
                                          color: MyColor.secondary400,
                                          size: AdaptSize.pixel20,
                                        ),
                                      ),
                                      Text(
                                        "Can Accomodate",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                color: MyColor.neutral200),
                                      ),
                                      Spacer(),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "120",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      color:
                                                          MyColor.secondary400,
                                                      fontSize:
                                                          AdaptSize.pixel16),
                                            ),
                                            TextSpan(
                                                text: "person",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                        color:
                                                            MyColor.neutral200))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
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
}
