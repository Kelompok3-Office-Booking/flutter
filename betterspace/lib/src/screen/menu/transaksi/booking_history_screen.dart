import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
        titleSpacing: 3,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.chevron_left,
          size: 28,
          color: MyColor.dark700Color,
        ),
        title: Text(
          "Booking History",
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontSize: AdaptSize.screenHeight / 1000 * 24),
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
              SizedBox(
                height: AdaptSize.screenHeight / 2.18,
                width: AdaptSize.screenWidth / 1.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)),
                        elevation: 2,
                        child: ListTile(
                          leading: Icon(
                            Icons.home,
                            size: 40,
                            color: MyColor.dark700Color,
                          ),
                          title: Text(
                            "No ID : xxxxx",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "2 November 2022",
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
                                          color: MyColor
                                              .secondary900ColorWaitStatusBody,
                                          border: Border.all(
                                              width: 1,
                                              color: MyColor
                                                  .secondary500ColorWaitStatusBorder),
                                          borderRadius:
                                              BorderRadius.circular(42)),
                                    ),
                                  ),
                                  Positioned(
                                    top: AdaptSize.screenHeight / 200,
                                    bottom: AdaptSize.screenHeight / 200,
                                    left: AdaptSize.screenWidth / 30,
                                    right: AdaptSize.screenWidth / 30,
                                    child: Text(
                                      "On Process",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: MyColor
                                                  .secondary500ColorWaitStatusBorder,
                                              fontSize: 11),
                                    ),
                                  ),
                                ],
                              )),
                        )),
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      child: SizedBox(
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
                              Padding(
                                padding: EdgeInsets.only(
                                    right: AdaptSize.screenWidth / 60),
                                child: Icon(
                                  Icons.chevron_right,
                                  size: 24,
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
