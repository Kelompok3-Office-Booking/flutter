import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/account_view_model.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/widget/dialog/custom_dialog.dart';
import 'package:betterspace/src/widget/widget/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigasiProvider =
        Provider.of<NavigasiViewModel>(context, listen: false);
    final accountProvider =
        Provider.of<AccountViewModel>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          top: AdaptSize.paddingTop + AdaptSize.screenHeight * .017,
          left: AdaptSize.screenWidth * .016,
          right: AdaptSize.screenWidth * .016,
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                'Profile',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: AdaptSize.screenHeight * .022),
              ),

              SizedBox(
                height: AdaptSize.screenHeight * .016,
              ),

              dividerWdiget(
                width: double.infinity,
                opacity: .1,
              ),

              SizedBox(
                height: AdaptSize.screenHeight * .016,
              ),

              /// image profile
              SizedBox(
                height: AdaptSize.screenHeight * .16,
                width: AdaptSize.screenWidth * .38,
                child: Stack(
                  children: [
                    /// image display
                    Consumer<AccountViewModel>(
                        builder: (context, value, child) {
                      return Container(
                        decoration: BoxDecoration(
                          color: MyColor.neutral800,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: MyColor.neutral600,
                            width: AdaptSize.screenHeight * .004,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: value.imageProfile != null
                                ? FileImage(value.imageProfile)
                                : const AssetImage(
                                    'assets/image_assets/default_image_profile.png',
                                  ) as ImageProvider,
                          ),
                        ),
                      );
                    }),

                    /// button pick image
                    Positioned(
                      bottom: AdaptSize.screenHeight * .01,
                      right: 0,
                      child: Container(
                        height: AdaptSize.screenHeight * .05,
                        width: AdaptSize.screenHeight * .05,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: MyColor.neutral600,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: MyColor.neutral900,
                            width: AdaptSize.screenWidth * .004,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            context.read<AccountViewModel>().pickImageProfile(
                                context,
                                'Your profile has been updated successfully !');
                          },
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: MyColor.neutral900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: AdaptSize.screenHeight * .008,
              ),

              /// username
              Text(
                'Erick Cahya',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontSize: AdaptSize.screenHeight * .016,
                      color: MyColor.neutral200,
                    ),
              ),

              SizedBox(
                height: AdaptSize.screenHeight * .004,
              ),

              /// email user
              Text(
                'Erickcahya@gmail.com',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: AdaptSize.screenHeight * .014,
                      color: MyColor.neutral400,
                    ),
              ),

              /// item list
              itemContainer(
                MediaQuery.removePadding(
                  context: context,
                  removeBottom: true,
                  removeTop: true,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: accountProvider.accountItem.length,
                      itemBuilder: (context, items) {
                        return menuItemAccount(
                            context: context,
                            onTap: () {
                              if (accountProvider.accountItem[items][2] == 3) {
                                CustomDialog.doubleActionDialog(
                                  context: context,
                                  title: 'Are you sure want to Logout ?',
                                  imageAsset:
                                      'assets/svg_assets/heart_break.svg',
                                  onTap1: () {
                                    navigasiProvider.navigasiLogout(context);
                                  },
                                  onTap2: () {
                                    navigasiProvider.navigasiPop(context);
                                  },
                                );
                              } else {
                                navigasiProvider.navigasiSettingItem(context,
                                    accountProvider.accountItem[items][2]);
                              }
                            },
                            icon: accountProvider.accountItem[items][1],
                            itemName: accountProvider.accountItem[items][0],
                            item: items);
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// item canvas
  Widget itemContainer(Widget child) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AdaptSize.screenHeight * .016),
      margin: EdgeInsets.only(top: AdaptSize.screenHeight * .016),
      decoration: BoxDecoration(
        color: MyColor.neutral900,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: MyColor.neutral500.withOpacity(.6),
              blurStyle: BlurStyle.solid,
              blurRadius: 3)
        ],
      ),
      child: child,
    );
  }

  /// main menu item list on account screen
  Widget menuItemAccount({
    context,
    Function()? onTap,
    required IconData icon,
    required String itemName,
    required int item,
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
                itemName,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: AdaptSize.screenHeight * .014,
                    ),
              ),
              const Spacer(),
              item == 3
                  ? const SizedBox()
                  : Icon(
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
        item == 3
            ? const SizedBox()
            : dividerWdiget(
                width: double.infinity,
                opacity: .1,
              ),
        item == 3
            ? const SizedBox()
            : SizedBox(
                height: AdaptSize.screenHeight * .01,
              ),
      ],
    );
  }
}
