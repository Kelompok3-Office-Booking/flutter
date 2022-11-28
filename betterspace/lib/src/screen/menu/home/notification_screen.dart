import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/widget/home_widget/notification_widget/all_notification_widget.dart';
import 'package:betterspace/src/widget/home_widget/notification_widget/info_notification_widget.dart';
import 'package:betterspace/src/widget/home_widget/notification_widget/transaction_notification_widget.dart';
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
    _tabBarController =
        TabController(length: 3, vsync: this, animationDuration: Duration.zero);
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                SizedBox(
                  width: AdaptSize.screenHeight * .044,
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
                labelStyle: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: AdaptSize.screenHeight * 0.014),
                indicatorColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding:
                    EdgeInsets.only(bottom: AdaptSize.screenHeight * 0.0015),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: MyColor.darkBlueColor,
                ),
                unselectedLabelColor: MyColor.grayLightColor.withOpacity(.9),
                tabs: [
                  tabBarContainer(
                    'All',
                    EdgeInsets.only(
                      left: AdaptSize.screenWidth * 0.048,
                      right: AdaptSize.screenWidth * 0.048,
                    ),
                  ),
                  tabBarContainer(
                    'Transaction',
                    EdgeInsets.only(
                      left: AdaptSize.screenWidth * 0.03,
                      right: AdaptSize.screenWidth * 0.03,
                    ),
                  ),
                  tabBarContainer(
                    'Info',
                    EdgeInsets.only(
                      left: AdaptSize.screenWidth * 0.048,
                      right: AdaptSize.screenWidth * 0.048,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                controller: _tabBarController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  allNotificationWidget(context),
                  transactionNotificationWidget(context),
                  infoNotificationWidget(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabBarContainer(String text, EdgeInsetsGeometry padding) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: MyColor.darkBlueColor.withOpacity(.5),
        ),
      ),
      child: Tab(
        text: text,
      ),
    );
  }
}
