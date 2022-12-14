import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/view_model/whislist_view_model.dart';
import 'package:betterspace/src/widget/dialog/custom_dialog.dart';
import 'package:betterspace/src/widget/office_card_widget/wishlist_card.dart';
import 'package:betterspace/src/widget/widget/card_shimmer_widget.dart';
import 'package:betterspace/src/widget/widget/default_appbar_widget.dart';
import 'package:betterspace/src/widget/widget/shimmer_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      backgroundColor: MyColor.neutral900,
      appBar: defaultAppbarWidget(
        contexts: context,
        leadIconFunction: () {
          context.read<NavigasiViewModel>().navigasiPop(context);
        },
        centerTitle: true,
        isCenterTitle: true,
        titles: 'Wishlist',
      ),
      body: Consumer<WhislistViewModel>(builder: (context, value, child) {
        if (value.whislist.isNotEmpty) {
          final whislistItem = value.whislist;
          return Padding(
            padding: EdgeInsets.only(
              top: AdaptSize.pixel8,

              /// 13/12/22 ubah ukuran padding
              left: AdaptSize.screenWidth * .016,
              right: AdaptSize.screenWidth * .016,
            ),
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: whislistItem.length,
                  itemBuilder: (context, index) {
                    return CachedNetworkImage(
                      imageUrl: whislistItem[index].officeImage!,
                      imageBuilder: (context, imageProvider) => whistListCard(
                        context: context,
                        officeImage: imageProvider,
                        officeRanting:
                            whislistItem[index].officeRanting!.toString(),
                        officeType: whislistItem[index].officeType!,
                        officeName: whislistItem[index].officeName!,
                        officeLocation: whislistItem[index].officeLocation!,
                        bookmarkOntap: () {
                          showDialog(
                            context: context,
                            builder: (context) =>
                                CustomDialog.dialogRemoveWhislist(
                              context: context,
                              onPressed1: () {
                                context
                                    .read<NavigasiViewModel>()
                                    .navigasiPop(context);
                              },
                              onPressed2: () {
                                value.removeWhislistOffice(index);
                                context
                                    .read<NavigasiViewModel>()
                                    .navigasiPop(context);
                              },
                            ),
                          );
                        },
                        cardOnTap: () {},
                      ),
                      placeholder: (context, url) => shimmerLoading(
                        child: CardShimmerHomeLoading.horizontalLoadShimmerHome,
                      ),
                      errorWidget: (context, url, error) =>
                          CardShimmerHomeLoading.horizontalFailedShimmerHome,
                    );
                  }),
            ),
          );
        }
        return Center(
            child: Column(
          children: [
            SizedBox(
              height: AdaptSize.screenHeight * .3,
            ),
            Image.asset(
              'assets/image_assets/close_up.png',
              height: AdaptSize.screenWidth / 1000 * 300,
              width: AdaptSize.screenWidth / 1000 * 300,
            ),
            SizedBox(
              height: AdaptSize.pixel10,
            ),
            Text(
              'the wishlist is still empty',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: AdaptSize.pixel14),
            ),
          ],
        ));
      }),
    );
  }
}
