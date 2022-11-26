import 'package:betterspace/src/model/data/notification_info_data.dart';
import 'package:betterspace/src/model/notification_model.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget infoNotificationWidget(BuildContext context) {
  return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: notificationInfo.length,
      itemBuilder: (context, index) {
        final NotificationModel infoNotification = notificationInfo[index];
        return Card(
          color: MyColor.netralColor,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.all(AdaptSize.screenHeight * 0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/svg_assets/info.svg'),
                    SizedBox(
                      width: AdaptSize.screenWidth * .008,
                    ),

                    /// category notification
                    Text(
                      infoNotification.category,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: AdaptSize.screenHeight * .014,
                          ),
                    ),
                    const Spacer(),

                    /// notification date time
                    Text(
                      infoNotification.day,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: AdaptSize.screenHeight * .014,
                          ),
                    ),
                  ],
                ),

                SizedBox(
                  height: AdaptSize.screenHeight * 0.01,
                ),

                /// notification title
                Text(
                  infoNotification.title,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: AdaptSize.screenHeight * 0.016,
                      ),
                ),

                SizedBox(
                  height: AdaptSize.screenHeight * 0.008,
                ),

                /// notification description
                Text(
                  infoNotification.description,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: AdaptSize.screenHeight * 0.014,
                      ),
                ),
              ],
            ),
          ),
        );
      });
}
