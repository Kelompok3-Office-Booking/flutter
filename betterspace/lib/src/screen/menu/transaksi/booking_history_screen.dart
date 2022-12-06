import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/material.dart';

class BookingHistoryScreen extends StatefulWidget {
  const BookingHistoryScreen({super.key});

  @override
  State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    AdaptSize.size(context: context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            "Booking History",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontSize: AdaptSize.screenHeight / 1000 * 24),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          //top: AdaptSize.paddingTop + AdaptSize.screenHeight / 19,
          left: AdaptSize.screenWidth / 22.5,
          right: AdaptSize.screenWidth / 22.5,
        ),
        child: SizedBox(
          height: AdaptSize.screenHeight,
          width: AdaptSize.screenWidth,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: AdaptSize.pixel8),
                child: SizedBox(
                  width: AdaptSize.screenWidth / 1.7,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    elevation: 2,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.domain_outlined,
                            size: 40,
                            color: MyColor.dark700Color,
                          ),
                          title: Text(
                            "ID07XCFF6",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "coworking",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: MyColor.dark700Color),
                          ),
                          trailing: SizedBox(
                            width: AdaptSize.screenWidth / 4,
                            height: AdaptSize.screenHeight / 33.3,
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: AdaptSize.screenWidth / 4,
                                  height: AdaptSize.screenHeight / 33.3,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: MyColor.success900,
                                        border: Border.all(
                                            width: 1,
                                            color: MyColor.success400),
                                        borderRadius:
                                            BorderRadius.circular(42)),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Accepted",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: MyColor.success400,
                                            fontSize: 11),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: AdaptSize.pixel8, bottom: AdaptSize.pixel8),
                          child: SizedBox(
                            width: AdaptSize.screenWidth / 1.15,
                            height: AdaptSize.pixel2,
                            child: DecoratedBox(
                              decoration:
                                  BoxDecoration(color: MyColor.neutral800),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AdaptSize.screenHeight / 5.4,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: AdaptSize.screenHeight / 100,
                                  bottom: AdaptSize.screenHeight / 100,
                                  left: AdaptSize.screenWidth / 48,
                                  right: AdaptSize.screenWidth / 24,
                                ),
                                child: SizedBox(
                                  width: AdaptSize.screenWidth / 2.8,
                                  height: AdaptSize.screenWidth / 2.8,
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
                                padding: EdgeInsets.only(
                                    top: AdaptSize.screenHeight / 40,
                                    bottom: AdaptSize.screenHeight / 40),
                                child: SizedBox(
                                  width: AdaptSize.screenWidth / 2.55,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom:
                                                AdaptSize.screenHeight / 100),
                                        child: Text(
                                          "Location xxxxxxxxxxxx",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                  color: MyColor.dark700Color,
                                                  fontSize: 16),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.calendar_month,
                                            size: 22,
                                            color: MyColor.grayLightColor,
                                          ),
                                          SizedBox(
                                            width: AdaptSize.screenWidth / 3,
                                            child: Text("Friday, 18 Nov 2022",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        color: MyColor
                                                            .grayLightColor)),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: AdaptSize.screenHeight / 100),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              size: 22,
                                              color: MyColor.grayLightColor,
                                            ),
                                            SizedBox(
                                              width: AdaptSize.screenWidth / 3,
                                              child: Text("18:00 - 19:00",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                          color: MyColor
                                                              .grayLightColor)),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: AdaptSize.pixel16, bottom: AdaptSize.pixel8),
                          child: SizedBox(
                            height: AdaptSize.pixel40,
                            width: AdaptSize.screenWidth / 1.53,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyColor.transparanColor,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                side: BorderSide(
                                    width: 2.0, color: MyColor.secondary400),
                              ),
                              child: Text(
                                "Check-in Now",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: MyColor.secondary400,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: AdaptSize.pixel8),
                child: SizedBox(
                  width: AdaptSize.screenWidth / 1.7,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    elevation: 2,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.domain_outlined,
                            size: 40,
                            color: MyColor.dark700Color,
                          ),
                          title: Text(
                            "ID07XCFF6",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "coworking",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: MyColor.dark700Color),
                          ),
                          trailing: SizedBox(
                              width: AdaptSize.screenWidth / 4,
                              height: AdaptSize.screenHeight / 33.3,
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: AdaptSize.screenWidth / 4,
                                    height: AdaptSize.screenHeight / 33.3,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: MyColor.danger900,
                                          border: Border.all(
                                              width: 1,
                                              color: MyColor.danger400),
                                          borderRadius:
                                              BorderRadius.circular(42)),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Cancelled",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: MyColor.danger400,
                                              fontSize: 11),
                                    ),
                                  )
                                ],
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: AdaptSize.pixel8, bottom: AdaptSize.pixel8),
                          child: SizedBox(
                            width: AdaptSize.screenWidth / 1.15,
                            height: AdaptSize.pixel2,
                            child: DecoratedBox(
                              decoration:
                                  BoxDecoration(color: MyColor.neutral800),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AdaptSize.screenHeight / 5.4,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: AdaptSize.screenHeight / 100,
                                  bottom: AdaptSize.screenHeight / 100,
                                  left: AdaptSize.screenWidth / 48,
                                  right: AdaptSize.screenWidth / 24,
                                ),
                                child: SizedBox(
                                  width: AdaptSize.screenWidth / 2.8,
                                  height: AdaptSize.screenWidth / 2.8,
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
                                padding: EdgeInsets.only(
                                    top: AdaptSize.screenHeight / 40,
                                    bottom: AdaptSize.screenHeight / 40),
                                child: SizedBox(
                                  width: AdaptSize.screenWidth / 2.55,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom:
                                                AdaptSize.screenHeight / 100),
                                        child: Text(
                                          "Location xxxxxxxxxxxx",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                  color: MyColor.dark700Color,
                                                  fontSize: 16),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.calendar_month,
                                            size: 22,
                                            color: MyColor.grayLightColor,
                                          ),
                                          SizedBox(
                                            width: AdaptSize.screenWidth / 3,
                                            child: Text("Friday, 18 Nov 2022",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        color: MyColor
                                                            .grayLightColor)),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: AdaptSize.screenHeight / 100),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              size: 22,
                                              color: MyColor.grayLightColor,
                                            ),
                                            SizedBox(
                                              width: AdaptSize.screenWidth / 3,
                                              child: Text("18:00 - 19:00",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                          color: MyColor
                                                              .grayLightColor)),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: AdaptSize.pixel16, bottom: AdaptSize.pixel8),
                          child: SizedBox(
                            height: AdaptSize.pixel40,
                            width: AdaptSize.screenWidth / 1.53,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyColor.neutral600,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                side: BorderSide(
                                    width: 2.0, color: MyColor.neutral600),
                              ),
                              child: Text(
                                "Check-in Now",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: MyColor.neutral700,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: AdaptSize.pixel8),
                child: SizedBox(
                  width: AdaptSize.screenWidth / 1.7,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    elevation: 2,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.domain_outlined,
                            size: 40,
                            color: MyColor.dark700Color,
                          ),
                          title: Text(
                            "ID07XCFF6",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "coworking",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: MyColor.dark700Color),
                          ),
                          trailing: SizedBox(
                              width: AdaptSize.screenWidth / 4,
                              height: AdaptSize.screenHeight / 33.3,
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: AdaptSize.screenWidth / 4,
                                    height: AdaptSize.screenHeight / 33.3,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: MyColor.secondary900,
                                          border: Border.all(
                                              width: 1,
                                              color: MyColor.secondary400),
                                          borderRadius:
                                              BorderRadius.circular(42)),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "On Process",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: MyColor.secondary400,
                                              fontSize: 11),
                                    ),
                                  )
                                ],
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: AdaptSize.pixel8, bottom: AdaptSize.pixel8),
                          child: SizedBox(
                            width: AdaptSize.screenWidth / 1.15,
                            height: AdaptSize.pixel2,
                            child: DecoratedBox(
                              decoration:
                                  BoxDecoration(color: MyColor.neutral800),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AdaptSize.screenHeight / 5.4,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: AdaptSize.screenHeight / 100,
                                  bottom: AdaptSize.screenHeight / 100,
                                  left: AdaptSize.screenWidth / 48,
                                  right: AdaptSize.screenWidth / 24,
                                ),
                                child: SizedBox(
                                  width: AdaptSize.screenWidth / 2.8,
                                  height: AdaptSize.screenWidth / 2.8,
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
                                padding: EdgeInsets.only(
                                    top: AdaptSize.screenHeight / 40,
                                    bottom: AdaptSize.screenHeight / 40),
                                child: SizedBox(
                                  width: AdaptSize.screenWidth / 2.55,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom:
                                                AdaptSize.screenHeight / 100),
                                        child: Text(
                                          "Location xxxxxxxxxxxx",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                  color: MyColor.dark700Color,
                                                  fontSize: 16),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.calendar_month,
                                            size: 22,
                                            color: MyColor.grayLightColor,
                                          ),
                                          SizedBox(
                                            width: AdaptSize.screenWidth / 3,
                                            child: Text("Friday, 18 Nov 2022",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        color: MyColor
                                                            .grayLightColor)),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: AdaptSize.screenHeight / 100),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              size: 22,
                                              color: MyColor.grayLightColor,
                                            ),
                                            SizedBox(
                                              width: AdaptSize.screenWidth / 3,
                                              child: Text("18:00 - 19:00",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                          color: MyColor
                                                              .grayLightColor)),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: AdaptSize.pixel16, bottom: AdaptSize.pixel8),
                          child: SizedBox(
                            height: AdaptSize.pixel40,
                            width: AdaptSize.screenWidth / 1.53,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyColor.neutral600,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                side: BorderSide(
                                    width: 2.0, color: MyColor.neutral600),
                              ),
                              child: Text(
                                "Check-in Now",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: MyColor.neutral700,
                                    ),
                              ),
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
      ),
    );
  }
}
