import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/view_model/promo_view_model.dart';
import 'package:betterspace/src/widget/home_widget/voucer_promo_widget/information_card.dart';
import 'package:betterspace/src/widget/home_widget/voucer_promo_widget/text_table_content.dart';
import 'package:betterspace/src/widget/widget/bottom_sheed_widget.dart';
import 'package:betterspace/src/widget/widget/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VoucerPromoScreen extends StatelessWidget {
  static var routeName = '/voucerPromoScreen';

  const VoucerPromoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detailVoucer = ModalRoute.of(context)?.settings.arguments as String;
    final voucerPromo = Provider.of<PromoViewModel>(context, listen: false)
        .findById(detailVoucer);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            left: AdaptSize.screenWidth * .016,
            right: AdaptSize.screenWidth * .016,
            top: AdaptSize.paddingTop,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<NavigasiViewModel>().navigasiPop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: AdaptSize.screenHeight * .022,
                    ),
                  ),
                  Text(
                    'Detail Voucer',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: AdaptSize.screenHeight * .022,
                        ),
                  ),
                  SizedBox(
                    width: AdaptSize.screenHeight * .044,
                  ),
                ],
              ),

              /// hero animation
              Hero(
                tag: voucerPromo.imagePromo,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: AdaptSize.screenHeight * .018,
                    bottom: AdaptSize.screenHeight * .018,
                  ),
                  child: Image.asset(
                    voucerPromo.imagePromo,
                  ),
                ),
              ),

              /// title promo
              Text(
                voucerPromo.title,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: AdaptSize.screenHeight * .016),
              ),

              SizedBox(
                height: AdaptSize.screenHeight * .018,
              ),

              /// vaoucer code
              Container(
                height: AdaptSize.screenHeight * .060,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: AdaptSize.screenHeight * .008),
                padding: EdgeInsets.all(AdaptSize.screenHeight * .018),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: MyColor.darkColor.withOpacity(.6),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      voucerPromo.voucerCode,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: AdaptSize.screenHeight * .016),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        context
                            .read<PromoViewModel>()
                            .changeCopyText(voucerPromo.voucerCode);
                      },
                      icon: const Icon(Icons.copy),
                    ),
                  ],
                ),
              ),

              ///berlaku hingga
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Berlaku Hingga',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: AdaptSize.screenHeight * .016),
                  ),
                  Text(
                    voucerPromo.expDate,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: AdaptSize.screenHeight * .016),
                  )
                ],
              ),

              SizedBox(
                height: AdaptSize.screenHeight * .018,
              ),

              /// card terms and condition
              cardInformationVoucer(
                context: context,
                image: 'assets/image_assets/terms_condition.png',
                textTitle: 'Terms and Conditions',
                descriptions:
                    'Vouchers in the form of discounts of up to 80% for every first use',
                onTap: () {
                  modalBottomSheed(
                    context,
                    textTableContent(
                      text1: voucerPromo.termCondition1,
                      text2: voucerPromo.termCondition2,
                      text3: voucerPromo.termCondition3,
                      text4: voucerPromo.termCondition4,
                      text5: voucerPromo.termCondition5,
                      t5: true,
                      titleTextStyle: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: AdaptSize.screenHeight * .02),
                      contentTextStyle:
                          Theme.of(context).textTheme.subtitle1!.copyWith(
                                fontSize: AdaptSize.screenHeight * .014,
                              ),
                    ),
                  );
                },
              ),

              /// card how to use
              cardInformationVoucer(
                context: context,
                image: 'assets/image_assets/how_to_use.png',
                textTitle: 'How To',
                descriptions: 'Select the workspace you want to reserve',
                onTap: () {
                  modalBottomSheed(
                    context,
                    textTableContent(
                      text1: voucerPromo.howToUse1,
                      text2: voucerPromo.howToUse2,
                      text3: voucerPromo.howToUse3,
                      text4: voucerPromo.howToUse4,
                      t5: false,
                      titleTextStyle: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: AdaptSize.screenHeight * .02),
                      contentTextStyle:
                          Theme.of(context).textTheme.subtitle1!.copyWith(
                                fontSize: AdaptSize.screenHeight * .014,
                              ),
                    ),
                  );
                },
              ),

              /// card description
              cardInformationVoucer(
                context: context,
                image: 'assets/image_assets/desctiption.png',
                textTitle: 'Description',
                descriptions:
                    'Special vouchers for you, enjoy up to 80% discount savings for the first use',
                onTap: () {
                  modalBottomSheed(
                    context,
                    descriptionsWidget(context, voucerPromo.promoDescription),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget descriptionsWidget(context, String text) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AdaptSize.screenWidth * .022,
        AdaptSize.screenHeight * .005,
        AdaptSize.screenWidth * .022,
        AdaptSize.screenHeight * .02,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: dividerWdiget(
              width: AdaptSize.screenWidth * 0.1,
              opacity: .4,
            ),
          ),
          Text(
            'Description',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontSize: AdaptSize.screenHeight * .02),
          ),
          SizedBox(
            height: AdaptSize.screenHeight * 0.01,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontSize: AdaptSize.screenHeight * .014,
                ),
          ),
          SizedBox(
            height: AdaptSize.screenHeight * 0.15,
          ),
        ],
      ),
    );
  }
}
