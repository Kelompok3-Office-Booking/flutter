import 'package:betterspace/src/model/data/general_notification_data.dart';
import 'package:betterspace/src/model/notification_model.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/widget/widget/rich_text_widget.dart';
import 'package:flutter/material.dart';

Widget generalWidget(BuildContext context) {
  return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: generalNotification.length,
      itemBuilder: (context, index) {
        final NotificationModel generalNotifications =
            generalNotification[index];
        return Card(
          color: MyColor.netralColor,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.all(AdaptSize.screenHeight * 0.01),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// image
                SizedBox(
                  height: AdaptSize.screenHeight * .07,
                  width: AdaptSize.screenHeight * .08,
                  child: Stack(
                    children: [
                      Container(
                        height: AdaptSize.screenHeight * .065,
                        width: AdaptSize.screenHeight * .065,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(generalNotifications.image),
                          ),
                        ),
                      ),

                      /// icon
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: AdaptSize.screenHeight * .035,
                          width: AdaptSize.screenHeight * .035,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: generalNotifications.backgroundColor,
                          ),
                          child: generalNotifications.logo,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: AdaptSize.screenHeight * .008,
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// notification title
                      Text(
                        generalNotifications.title,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontSize: AdaptSize.screenHeight * 0.016,
                            ),
                      ),

                      SizedBox(
                        height: AdaptSize.screenHeight * 0.008,
                      ),

                      /// notification description
                      richTextWidget(
                        text1: generalNotifications.description,
                        textStyle1:
                            Theme.of(context).textTheme.bodyText1!.copyWith(
                                  fontSize: AdaptSize.screenHeight * 0.014,
                                ),
                        text2: generalNotifications.descriptionkey,
                        textStyle2: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: AdaptSize.screenHeight * 0.014),
                      ),

                      SizedBox(
                        height: AdaptSize.screenHeight * 0.008,
                      ),

                      Text(
                        generalNotifications.day,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: AdaptSize.screenHeight * 0.014,
                              color: MyColor.neutral600,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
