import 'package:betterspace/src/model/data/general_notification_data.dart';
import 'package:betterspace/src/model/data/recommen_transaction_data.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/widget/home_widget/notification_widget/general_notification_widget.dart';
import 'package:betterspace/src/widget/home_widget/notification_widget/recommendation_notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabBarController;

  @override
  void initState() {
    super.initState();
    _tabBarController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabBarController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: AdaptSize.paddingTop,
          left: AdaptSize.screenWidth * .016,
          right: AdaptSize.screenWidth * .016,
        ),
        child: Column(
          children: [
            /// header
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.read<NavigasiViewModel>().navigasiPop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: AdaptSize.screenHeight * .022,
                  ),
                ),
                Text(
                  'Notification',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: AdaptSize.screenHeight * .022,
                      ),
                ),
              ],
            ),

            SizedBox(
              height: AdaptSize.screenHeight * .022,
            ),

            /// tab bar
            SizedBox(
              height: AdaptSize.screenHeight * 0.035,
              width: double.infinity,
              child: TabBar(
                controller: _tabBarController,
                isScrollable: true,
                labelStyle: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: AdaptSize.screenHeight * .016),
                indicatorColor: MyColor.primary400,
                indicatorSize: TabBarIndicatorSize.tab,
                labelPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                labelColor: MyColor.primary400,
                unselectedLabelColor: MyColor.grayLightColor.withOpacity(.9),
                tabs: [
                  tabSized(
                    sizeWidth: AdaptSize.screenWidth * .242,
                    tab1: 'General',
                    valueTab1: generalNotification.length.toString(),
                  ),
                  tabSized(
                    sizeWidth: AdaptSize.screenWidth * .41,
                    tab1: 'Recommendation',
                    valueTab1: notificationRecomen.length.toString(),
                  ),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                controller: _tabBarController,
                children: [
                  generalWidget(context),
                  recommendationNotificationWidget(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabSized({
    required double sizeWidth,
    required String tab1,
    required String valueTab1,
  }) {
    return SizedBox(
      width: sizeWidth,
      child: Row(
        children: [
          Tab(
            text: tab1,
          ),
          SizedBox(
            width: AdaptSize.pixel4,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(
                color: MyColor.grayLightColor.withOpacity(.9),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                right: AdaptSize.screenHeight * .008,
                left: AdaptSize.screenHeight * .008,
                top: AdaptSize.screenHeight * .001,
                bottom: AdaptSize.screenHeight * .001,
              ),
              child: Tab(
                text: valueTab1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
