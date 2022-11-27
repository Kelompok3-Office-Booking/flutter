import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class bookingHistoryScreen extends StatefulWidget {
  const bookingHistoryScreen({super.key});

  @override
  State<bookingHistoryScreen> createState() => _bookingHistoryScreenState();
}

class _bookingHistoryScreenState extends State<bookingHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: AdaptSize.screenHeight,
        width: AdaptSize.screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back),
                ),
                Text(
                  "Booking History",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
            ListView(
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
