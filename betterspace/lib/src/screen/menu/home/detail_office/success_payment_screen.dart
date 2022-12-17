import 'package:betterspace/src/screen/error/no_connection_screen.dart';
import 'package:betterspace/src/screen/landing/network_aware.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/widget/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuccessPaymentScreen extends StatelessWidget {
  const SuccessPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return context.read<NavigasiViewModel>().navigasiBackToMenu(context);
      },
      child: NetworkAware(
        offlineChild: const NoConnectionScreen(),
        onlineChild: Scaffold(
          body: Padding(
            padding: EdgeInsets.only(
              top: AdaptSize.paddingTop + AdaptSize.screenHeight * .016,
              left: AdaptSize.screenWidth * .016,
              right: AdaptSize.screenWidth * .016,
              bottom: AdaptSize.screenHeight * .008,
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/image_assets/success_payment.png',
                  height: AdaptSize.screenHeight * .5,
                  width: AdaptSize.screenWidth * 1,
                ),

                SizedBox(
                  height: AdaptSize.screenHeight * .032,
                ),

                Text(
                  'Yey Payment Complete!',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: AdaptSize.pixel20),
                ),

                SizedBox(
                  height: AdaptSize.screenHeight * .008,
                ),

                Padding(
                  padding: EdgeInsets.only(
                    left: AdaptSize.pixel16,
                    right: AdaptSize.pixel16,
                  ),
                  child: Text(
                    'Open the Booking history to see details of the transaction status',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: AdaptSize.pixel14,
                          color: MyColor.neutral200,
                        ),
                  ),
                ),

                const Spacer(),

                /// button see order detail
                buttonWidget(
                  onPressed: () {
                    context
                        .read<NavigasiViewModel>()
                        .navigasiToDetailOrder(context);
                  },
                  sizeheight: AdaptSize.screenHeight / 14,
                  sizeWidth: double.infinity,
                  borderRadius: BorderRadius.circular(10),
                  backgroundColor: MyColor.secondary400,
                  child: Text(
                    'See Detail Order',
                    style: Theme.of(context).textTheme.button!.copyWith(
                        color: MyColor.neutral900, fontSize: AdaptSize.pixel14),
                  ),
                ),

                SizedBox(
                  height: AdaptSize.screenHeight * .018,
                ),

                /// button booking history
                buttonWidget(
                  onPressed: () {
                    context
                        .read<NavigasiViewModel>()
                        .navigasiBackToBookingHistory(context);
                  },
                  sizeheight: AdaptSize.screenHeight / 14,
                  sizeWidth: double.infinity,
                  backgroundColor: MyColor.neutral900,
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: MyColor.secondary400,
                  ),
                  child: Text(
                    'Booking History',
                    style: Theme.of(context).textTheme.button!.copyWith(
                          color: MyColor.secondary400,
                          fontSize: AdaptSize.pixel14,
                        ),
                  ),
                ),

                SizedBox(
                  height: AdaptSize.screenHeight * .038,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
