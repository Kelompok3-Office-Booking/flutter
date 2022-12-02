import 'package:betterspace/src/utils/adapt_size.dart';
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
      body: Padding(
        padding: EdgeInsets.only(
            top: AdaptSize.pixel8,
            left: AdaptSize.pixel16,
            right: AdaptSize.pixel16),
        child: ListView(),
      ),
    );
  }
}
