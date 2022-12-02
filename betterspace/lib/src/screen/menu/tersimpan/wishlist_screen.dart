import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/widget/widget/transparent_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    AdaptSize.size(context: context);
    return Scaffold(
      appBar: transparentAppbarWidget(
        context: context,
        leadingIcon: IconButton(
          onPressed: () {},
          icon: Padding(
            padding: EdgeInsets.only(left: AdaptSize.pixel20),
            child: Icon(
              Icons.arrow_back,
              color: MyColor.neutral200,
              size: AdaptSize.pixel26,
            ),
          ),
        ),
        titleSpacer: AdaptSize.pixel24,
        titles: Text(
          "Wishlist",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: MyColor.neutral200),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: AdaptSize.pixel8,
            left: AdaptSize.pixel16,
            right: AdaptSize.pixel16),
        child: ListView(
          children: [
            SizedBox(
              height: AdaptSize.screenWidth / 3.3,
            )
          ],
        ),
      ),
    );
  }
}
