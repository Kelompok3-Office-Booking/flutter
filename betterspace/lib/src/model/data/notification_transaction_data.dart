import 'package:betterspace/src/model/notification_model.dart';

List<NotificationModel> notificationTransaction = [
  NotificationModel(
    category: 'Transaction',
    title: 'Thank you, your review is very helpful',
    day: '5 Days Ago',
    description:
        'Don\'t forget to give ratings, comments as well as photos to help other buyers.',
  ),
  NotificationModel(
    category: 'Transaction',
    title: 'Your payment has been verified!',
    day: '7 Days Ago',
    description:
        'We have received your payment, please wait for further confirmation!',
  ),
  NotificationModel(
    category: 'Transaction',
    title: 'Your order failed!',
    day: '1 Week Ago',
    description: 'Try to check your order, why can it fail? :(',
  ),
];
