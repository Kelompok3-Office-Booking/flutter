import 'package:flutter/material.dart';

Widget allSpaces(context, String text, Function() onTap) {
  return Row(
    children: [
      Text(
        text,
        style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 16),
      ),
      const Spacer(),
      InkWell(
        onTap: onTap,
        child: Text(
          'All',
          style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 16),
        ),
      ),
      const Icon(
        Icons.arrow_forward_ios_outlined,
        size: 16,
      )
    ],
  );
}
