import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/widget/widget/divider_widget.dart';
import 'package:flutter/material.dart';

Widget cardBookingHistory({
  context,
  Function()? onTap,
  Widget? buttonCheckIn,
  required String bookingId,
  required Widget statusBooking,
  required String officeName,
  required String officeType,
  required String dateCheckIn,
  required String hoursCheckIn,
  required Widget buttonStatus,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
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
              bookingId,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontSize: AdaptSize.pixel14),
            ),
            subtitle: Text(
              officeType,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: MyColor.dark700Color,
                    fontSize: AdaptSize.pixel12,
                  ),
            ),
            trailing: statusBooking,
          ),
          dividerWdiget(width: double.infinity, opacity: .2),
          SizedBox(
            height: AdaptSize.pixel14,
          ),
          SizedBox(
            height: AdaptSize.screenHeight / 5.4,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(
                  left: AdaptSize.screenWidth / 48,
                  right: AdaptSize.screenWidth / 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  /// image
                  SizedBox(
                    width: AdaptSize.screenWidth / 2.8,
                    height: AdaptSize.screenWidth / 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: const Image(
                        image: AssetImage(
                            "assets/image_assets/space_image/space1.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SizedBox(
                    width: AdaptSize.pixel8,
                  ),

                  /// detail card
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: AdaptSize.screenHeight / 100),
                          child: Text(
                            officeName,
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: MyColor.dark700Color,
                                      fontSize: AdaptSize.pixel15,
                                    ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        const Spacer(),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.calendar_month,
                              size: 22,
                              color: MyColor.grayLightColor,
                            ),
                            Text(
                              dateCheckIn,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: MyColor.grayLightColor,
                                    fontSize: AdaptSize.pixel12,
                                  ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),

                        SizedBox(
                          height: AdaptSize.screenHeight / 100,
                        ),

                        /// keterangan jam
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 22,
                              color: MyColor.grayLightColor,
                            ),
                            Text(
                              hoursCheckIn,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: MyColor.grayLightColor,
                                    fontSize: AdaptSize.pixel12,
                                  ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// button status booking
          buttonStatus,

          SizedBox(
            height: AdaptSize.pixel8,
          ),
        ],
      ),
    ),
  );
}
