import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/widget/widget/button_widget.dart';
import 'package:flutter/material.dart';

class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdaptSize.size(context: context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: AdaptSize.paddingTop,
          left: AdaptSize.screenWidth * .016,
          right: AdaptSize.screenWidth * .016,
        ),
        child: Column(
          children: [
            SizedBox(
              height: AdaptSize.screenHeight * .25,
            ),
            Image.asset('assets/image_assets/nointernet_connection.png'),
            SizedBox(
              height: AdaptSize.screenHeight * .018,
            ),
            Text(
              'No Internet Issues',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontSize: AdaptSize.pixel15),
            ),
            SizedBox(
              height: AdaptSize.screenHeight * .016,
            ),
            Text(
              'Internet connection is bad, but no worries, we got it! Try reload the app',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: AdaptSize.pixel14),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            buttonWidget(
              onPressed: () {},
              backgroundColor: MyColor.secondary400,
              borderRadius: BorderRadius.circular(10),
              sizeheight: AdaptSize.pixel40,
              sizeWidth: double.infinity,
              child: Text(
                'Reload Now',
                style: Theme.of(context).textTheme.button!.copyWith(
                      fontSize: AdaptSize.pixel14,
                      color: MyColor.neutral900,
                    ),
              ),
            ),
            SizedBox(
              height: AdaptSize.screenHeight * .02,
            ),
          ],
        ),
      ),
    );
  }
}
