import 'package:barcode_widget/barcode_widget.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/transaction_view_model.dart';
import 'package:betterspace/src/widget/home_widget/voucer_promo_widget/text_table_content.dart';
import 'package:betterspace/src/widget/widget/button_widget.dart';
import 'package:betterspace/src/widget/widget/divider_widget.dart';
import 'package:betterspace/src/widget/widget/line_dash_widget.dart';
import 'package:betterspace/src/widget/widget/transparent_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class PaymentDetailScreen extends StatefulWidget {
  const PaymentDetailScreen({Key? key}) : super(key: key);

  @override
  State<PaymentDetailScreen> createState() => _PaymentDetailScreenState();
}

class _PaymentDetailScreenState extends State<PaymentDetailScreen> {
  var uuid = const Uuid();

  @override
  void initState() {
    super.initState();
    debugPrint(uuid.v4());
  }

  @override
  Widget build(BuildContext context) {
    final transactionProvider =
        Provider.of<TransactionViewModel>(context, listen: false);
    return Scaffold(
      appBar: transparentAppbarWidget(
        context: context,
        titles: Text(
          'Payment Detail',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        padding: EdgeInsets.only(
          top: AdaptSize.screenHeight * .016,
          left: AdaptSize.screenWidth * .016,
          right: AdaptSize.screenWidth * .016,
          bottom: AdaptSize.screenHeight * .024,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// header
            Row(
              children: [
                Text(
                  'Complete in',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: AdaptSize.screenHeight * .016),
                ),
                const Spacer(),

                /// timer countdown
                TweenAnimationBuilder<Duration>(
                    duration: const Duration(hours: 60),
                    tween: Tween(
                      begin: const Duration(hours: 60),
                      end: Duration.zero,
                    ),
                    onEnd: () {
                      /// blm di custom
                      debugPrint('Timer ended');
                    },
                    builder:
                        (BuildContext context, Duration value, Widget? child) {
                      final hours = value.inHours % 60;
                      final minutes = value.inMinutes % 60;
                      final seconds = value.inSeconds % 60;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          '$hours:$minutes:$seconds',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  color: MyColor.danger300,
                                  fontSize: AdaptSize.screenHeight * .016),
                        ),
                      );
                    }),
              ],
            ),

            SizedBox(
              height: AdaptSize.screenHeight * .016,
            ),

            /// header content
            headerContent(),

            SizedBox(
              height: AdaptSize.screenHeight * .016,
            ),

            headlineTitle('Payment Method'),

            SizedBox(
              height: AdaptSize.screenHeight * .016,
            ),

            /// text scan qr code
            Row(
              children: [
                Image.asset('assets/image_assets/qris_payment.png'),
                SizedBox(
                  height: AdaptSize.screenWidth * .016,
                ),
                Text(
                  'Scan QR Code',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontSize: AdaptSize.screenHeight * .016),
                ),
              ],
            ),

            /// payment / qr code
            Center(
              child: Container(
                height: AdaptSize.screenHeight * .2,
                width: AdaptSize.screenHeight * .2,
                margin: EdgeInsets.only(
                  top: AdaptSize.screenHeight * .016,
                  bottom: AdaptSize.screenHeight * .016,
                ),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: MyColor.neutral900,
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(1, 2),
                        color: MyColor.primary800.withOpacity(.4),
                        blurRadius: 5),
                  ],
                ),
                child: BarcodeWidget(
                  data: uuid.v4(),
                  barcode: Barcode.qrCode(),
                ),
              ),
            ),

            /// icon donwload
            Center(
              child: IconButton(
                onPressed: () {},
                padding: EdgeInsets.only(bottom: AdaptSize.screenHeight * .016),
                icon: const Icon(Icons.file_download_outlined),
              ),
            ),

            /// total payment
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Payment',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontSize: AdaptSize.screenHeight * .016),
                ),
                Text(
                  NumberFormat.currency(
                          locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                      .format(100000),
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: MyColor.darkBlueColor,
                        fontSize: AdaptSize.screenHeight * .016,
                      ),
                ),
              ],
            ),

            SizedBox(
              height: AdaptSize.screenHeight * .008,
            ),

            dividerWdiget(width: double.infinity, opacity: .1),

            SizedBox(
              height: AdaptSize.screenHeight * .008,
            ),

            headlineTitle('Reservation Detail'),

            SizedBox(
              height: AdaptSize.screenHeight * .016,
            ),

            /// list reservation detail
            SizedBox(
              height: AdaptSize.screenHeight * .11,
              width: double.infinity,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: AdaptSize.screenHeight * .003),
                      child: Row(
                        children: [
                          Icon(
                            Icons.account_circle,
                            size: AdaptSize.screenHeight * .024,
                          ),
                          SizedBox(
                            width: AdaptSize.screenWidth * .016,
                          ),
                          Text(
                            'Username',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: AdaptSize.screenHeight * .016),
                          ),
                        ],
                      ),
                    );
                  }),
            ),

            dividerWdiget(width: double.infinity, opacity: .2),

            SizedBox(
              height: AdaptSize.screenHeight * .013,
            ),

            headlineTitle('Summary Detail Payment'),

            SizedBox(
              height: AdaptSize.screenHeight * .016,
            ),

            /// total price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Price'),
                Text(
                  NumberFormat.currency(
                          locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                      .format(100000),
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: MyColor.darkBlueColor,
                        fontSize: AdaptSize.screenHeight * .016,
                      ),
                ),
              ],
            ),

            SizedBox(
              height: AdaptSize.screenHeight * .01,
            ),

            /// garis putus2
            LineDashWidget(color: MyColor.neutral700),

            SizedBox(
              height: AdaptSize.screenHeight * .01,
            ),

            /// summary detail payment
            ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total Price'),
                          Text(
                            NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 0)
                                .format(100000),
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: MyColor.darkBlueColor,
                                      fontSize: AdaptSize.screenHeight * .016,
                                    ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AdaptSize.screenHeight * .008,
                      ),
                    ],
                  );
                }),

            dividerWdiget(width: double.infinity, opacity: .2),

            ListView.builder(
                itemCount: 2,
                padding: EdgeInsets.only(top: AdaptSize.screenHeight * .008),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total Price'),
                          Text(
                            NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 0)
                                .format(100000),
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: MyColor.darkBlueColor,
                                      fontSize: AdaptSize.screenHeight * .016,
                                    ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AdaptSize.screenHeight * .008,
                      ),
                    ],
                  );
                }),

            dividerWdiget(width: double.infinity, opacity: .1),

            SizedBox(
              height: AdaptSize.screenHeight * .016,
            ),

            /// drop button
            Consumer<TransactionViewModel>(builder: (context, value, child) {
              return Column(
                children: [
                  InkWell(
                    splashColor: MyColor.neutral900,
                    onTap: () {
                      transactionProvider.isDropDown();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        headlineTitle('Payment via Scan QR'),
                        value.dropDown1 == true
                            ? const Icon(Icons.keyboard_arrow_down_sharp)
                            : const Icon(Icons.keyboard_arrow_up_sharp)
                      ],
                    ),
                  ),
                  dividerWdiget(width: double.infinity, opacity: .2)
                ],
              );
            }),

            /// drop down list item
            Consumer<TransactionViewModel>(builder: (context, value, child) {
              return value.dropDown1 == true
                  ? const SizedBox()
                  : textTableContent(
                      text1:
                          'Open the application that support QRIS (Dana, Ovo, LinkAja, Shoope Pay, etc)',
                      text2: 'Select Scan QR Code.',
                      text3: 'Confirm QR Code.',
                      text4: 'Input Your PIN',
                      text5: 'Done',
                      t5: true,
                      withDivider: false,
                      bottomDivider: true,
                    );
            }),

            SizedBox(
              height: AdaptSize.screenHeight * .016,
            ),

            /// button have already payment
            buttonWidget(
              onPressed: () {},
              backgroundColor: MyColor.secondary400,
              sizeheight: AdaptSize.screenHeight / 14,
              borderRadius: BorderRadius.circular(10),
              sizeWidth: double.infinity,
              child: Text(
                'I have already paid',
                style: Theme.of(context)
                    .textTheme
                    .button!
                    .copyWith(color: MyColor.neutral900),
              ),
            ),

            SizedBox(
              height: AdaptSize.screenHeight * .016,
            ),

            /// button need help
            Center(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  'Need Help ?',
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: MyColor.neutral500),
                ),
              ),
            ),

            SizedBox(
              height: AdaptSize.screenHeight * .016,
            ),
          ],
        ),
      ),
    );
  }

  /// split header content
  Widget headerContent() {
    return Container(
      height: AdaptSize.screenHeight * .16,
      width: double.infinity,
      margin: EdgeInsets.only(
        bottom: AdaptSize.screenHeight * .008,
      ),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: MyColor.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: const Offset(1, 3),
            color: MyColor.grayLightColor.withOpacity(.4),
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        children: [
          /// space image
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              width: AdaptSize.screenWidth * .36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/image_assets/space_image/space1.png',
                  ),
                ),
              ),
            ),
          ),

          /// jarak samping
          SizedBox(
            width: AdaptSize.screenWidth * .008,
          ),

          /// keterangan
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Working Space Johar',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: AdaptSize.screenHeight * .017),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                /// jarak bawah
                SizedBox(
                  height: AdaptSize.screenHeight * .008,
                ),

                /// lokasi
                const Text('Tebet, South Jakarta'),

                /// jarak bawah
                SizedBox(
                  height: AdaptSize.screenHeight * .008,
                ),

                /// icon keterangan
                Flexible(
                  child: Row(
                    children: [
                      /// icon lokasi
                      Icon(
                        Icons.location_on_outlined,
                        size: AdaptSize.screenHeight * .025,
                      ),

                      /// keterangan lokasi
                      Text(
                        '50m',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: AdaptSize.screenHeight * .014),
                      ),

                      SizedBox(
                        width: AdaptSize.screenHeight * .012,
                      ),

                      /// total person asset
                      SvgPicture.asset(
                        'assets/svg_assets/available.svg',
                        height: AdaptSize.screenHeight * .025,
                      ),

                      const SizedBox(
                        width: 2,
                      ),

                      /// total person
                      Text(
                        '160',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: AdaptSize.screenHeight * .014),
                      ),

                      SizedBox(
                        width: AdaptSize.screenHeight * .012,
                      ),

                      /// icon penggaris
                      SvgPicture.asset(
                        'assets/svg_assets/ruler.svg',
                        height: AdaptSize.screenHeight * .025,
                      ),

                      const SizedBox(
                        width: 2,
                      ),

                      /// jarak lokasi
                      Text(
                        '10m2',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: AdaptSize.screenHeight * .014),
                      ),
                    ],
                  ),
                ),
                const Spacer(),

                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: MyColor.primary700,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.5),
                    child: Text(
                      'Kategori',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: MyColor.primary700,
                          fontSize: AdaptSize.screenHeight * .014),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// content title
  Widget headlineTitle(String title) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headline6!
          .copyWith(fontSize: AdaptSize.screenHeight * .016),
    );
  }
}
