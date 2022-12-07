import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/account_view_model.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/widget/dialog/custom_dialog.dart';
import 'package:betterspace/src/widget/widget/divider_widget.dart';
import 'package:betterspace/src/widget/widget/transparent_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingProvider =
        Provider.of<AccountViewModel>(context, listen: false);
    final navigasiProvider = Provider.of<NavigasiViewModel>(context,listen: false);

    AdaptSize.size(context: context);
    return Scaffold(
      appBar: transparentAppbarWidget(
        context: context,
        titles: Text(
          'Setting',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontSize: AdaptSize.pixel16,
              ),
        ),
        titleSpacer: AdaptSize.pixel16,
        leadingIcon: IconButton(
          onPressed: () {
            navigasiProvider.navigasiPop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: MyColor.darkColor,
            size: AdaptSize.pixel16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: AdaptSize.screenWidth * .016,
          right: AdaptSize.screenWidth * .016,
        ),
        child: Column(
          children: [
            SizedBox(
              height: AdaptSize.pixel16,
            ),

            /// setting item 1
            itemContainer(
              child: MediaQuery.removePadding(
                removeTop: true,
                removeBottom: true,
                context: context,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: settingProvider.itemSetting1.length,
                    itemBuilder: (context, item) {
                      return itemSettings(
                        context: context,
                          onTap: () {
                            if (settingProvider.itemSetting1[item][2] == 3) {
                              CustomDialog.doubleActionDialog(
                                context: context,
                                title: 'Are you sure want to delete your account ?',
                                imageAsset:
                                'assets/svg_assets/delete.svg',
                                onTap1: () {
                                  navigasiProvider.navigasiLogout(context);
                                },
                                onTap2: () {
                                  navigasiProvider.navigasiPop(context);
                                },
                              );
                            } else {
                              context
                                  .read<NavigasiViewModel>()
                                  .navigasiSettingItem(context,
                                      settingProvider.itemSetting1[item][2]);
                            }
                          },
                          icon: settingProvider.itemSetting1[item][0],
                          text: settingProvider.itemSetting1[item][1],
                          paddingBottom:
                              settingProvider.itemSetting1[item] == 2);
                    }),
              ),
            ),

            /// setting item 2
            itemContainer(
              child: MediaQuery.removePadding(
                removeTop: true,
                removeBottom: true,
                context: context,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: settingProvider.itemSetting2.length,
                    itemBuilder: (context, item) {
                      return itemSettings(
                        context: context,
                          onTap: () {
                            context
                                .read<NavigasiViewModel>()
                                .navigasiSettingItem(context,
                                    settingProvider.itemSetting2[item][2]);
                          },
                          icon: settingProvider.itemSetting2[item][0],
                          text: settingProvider.itemSetting2[item][1],
                          paddingBottom:
                              settingProvider.itemSetting2[item] == 2);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// canvas item
  Widget itemContainer({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        AdaptSize.screenHeight * .016,
        AdaptSize.screenHeight * .032,
        AdaptSize.screenHeight * .016,
        AdaptSize.screenHeight * .016,
      ),
      margin: EdgeInsets.only(top: AdaptSize.screenHeight * .016),
      decoration: BoxDecoration(
        color: MyColor.neutral900,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: MyColor.neutral500.withOpacity(.6),
            blurStyle: BlurStyle.solid,
            blurRadius: 3,
          )
        ],
      ),
      child: child,
    );
  }

  /// item menu
  Widget itemSettings({
    context,
    required String text,
    required bool paddingBottom,
    Function()? onTap,
    IconData? icon,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Icon(icon, size: AdaptSize.screenHeight * .024),
              SizedBox(
                width: AdaptSize.screenWidth * .016,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: AdaptSize.screenHeight * .014,
                    ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: MyColor.neutral500,
                size: AdaptSize.screenHeight * .024,
              ),
            ],
          ),
        ),
        SizedBox(
          height: AdaptSize.screenHeight * .01,
        ),
        dividerWdiget(
          width: double.infinity,
          opacity: .1,
        ),
        paddingBottom
            ? const SizedBox()
            : SizedBox(
                height: AdaptSize.screenHeight * .01,
              ),
      ],
    );
  }
}
