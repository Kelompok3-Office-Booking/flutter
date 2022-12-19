import 'package:betterspace/src/model/data/map_space_data.dart';
import 'package:betterspace/src/model/map_space_model.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/office_viewmodels.dart';
import 'package:flutter/material.dart';

Widget searchMapWidget({
  required BuildContext context,
  required String allOfficeCity,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Flexible(
        fit: FlexFit.tight,
        child: Image.asset('assets/image_assets/image_maps.png'),
      ),
      Padding(
        padding: EdgeInsets.all(
          AdaptSize.screenHeight * 0.008,
        ),
        child: Text(
          allOfficeCity,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontSize: AdaptSize.screenHeight * 0.016,
              ),
        ),
      ),
    ],
  );
}
