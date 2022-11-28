import 'package:betterspace/src/model/data/notification_info_data.dart';
import 'package:betterspace/src/model/data/notification_transaction_data.dart';
import 'package:betterspace/src/model/notification_model.dart';

List<NotificationModel> allNotification = [
  ...notificationInfo,
  ...notificationTransaction,
];
