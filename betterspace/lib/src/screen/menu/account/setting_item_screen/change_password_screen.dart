import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/utils/form_validator.dart';
import 'package:betterspace/src/view_model/account_view_model.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/widget/widget/button_widget.dart';
import 'package:betterspace/src/widget/widget/loading_widget.dart';
import 'package:betterspace/src/widget/widget/text_filed_widget.dart';
import 'package:betterspace/src/widget/widget/transparent_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _updatePasswordController =
      TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    _updatePasswordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppbarWidget(
        context: context,
        titles: Text(
          'Change Password',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontSize: AdaptSize.pixel16,
              ),
        ),
        titleSpacer: AdaptSize.pixel16,
        leadingIcon: IconButton(
          onPressed: () {
            context.read<NavigasiViewModel>().navigasiPop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: MyColor.neutral100,
            size: AdaptSize.pixel16,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: AdaptSize.screenWidth * .016,
          right: AdaptSize.screenWidth * .016,
        ),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AdaptSize.pixel16,
              ),

              /// update password
              textFormFields(
                label: 'Update Password',
                controller: _updatePasswordController,
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: AdaptSize.screenHeight * .016),
                validators: (value) => FormValidator.validate(
                  title: 'password',
                  value1: _updatePasswordController.text,
                  value2: _confirmPasswordController.text,
                ),
                hintTexts: '********',
                obscureText: false,
                textInputAction: TextInputAction.done,
              ),

              SizedBox(
                height: AdaptSize.pixel10,
              ),

              /// confirm update password
              textFormFields(
                label: 'Confirm Update Password',
                controller: _confirmPasswordController,
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: AdaptSize.screenHeight * .016),
                validators: (value) => FormValidator.validate(
                  title: 'password',
                  value1: _updatePasswordController.text,
                  value2: _confirmPasswordController.text,
                ),
                hintTexts: '********',
                obscureText: false,
                textInputAction: TextInputAction.done,
              ),

              SizedBox(
                height: AdaptSize.screenHeight * .018,
              ),

              /// button submit
              Consumer<AccountViewModel>(builder: (context, value, child) {
                return buttonWidget(
                  sizeheight: AdaptSize.screenHeight / 14,
                  sizeWidth: double.infinity,
                  borderRadius: BorderRadius.circular(10),
                  backgroundColor: MyColor.darkBlueColor,
                  onPressed: () async {
                    if (_key.currentState!.validate()) {
                      value.changeProfile(context, 'Your password has been updated successfully!');
                      _updatePasswordController.clear();
                      _confirmPasswordController.clear();
                    }
                  },
                  child: value.isLoading
                      ? LoadingWidget.whiteButtonLoading
                      : Text(
                          "Save Changes",
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(color: MyColor.whiteColor),
                        ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
