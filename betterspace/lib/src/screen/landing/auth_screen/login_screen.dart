import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/get_location_view_model.dart';
import 'package:betterspace/src/view_model/login_view_model.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/widget/widget/button_widget.dart';
import 'package:betterspace/src/widget/widget/loading_widget.dart';
import 'package:betterspace/src/widget/widget/rich_text_widget.dart';
import 'package:betterspace/src/widget/widget/text_button_widget.dart';
import 'package:betterspace/src/widget/widget/text_filed_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AdaptSize.size(context: context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
            top: AdaptSize.paddingTop + AdaptSize.screenHeight / 19,
            left: AdaptSize.screenWidth / 22.5,
            right: AdaptSize.screenWidth / 22.5),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: AdaptSize.screenHeight / 400),
                child: Text(
                  "Welcome,",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: AdaptSize.screenHeight / 33.3),
                child: Text(
                  "let's login to use the app",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),

              /// email field
              textFormFields(
                obscureText: false,
                textStyle: Theme.of(context).textTheme.bodyText1,
                textInputAction: TextInputAction.done,
                hintTexts: 'example@gmail.com',
                label: 'Email',
                controller: _emailController,
                autoValidate: AutovalidateMode.onUserInteraction,
                validators: (email) =>
                    email == null || !EmailValidator.validate(email)
                        ? "enter valid email"
                        : null,
              ),

              SizedBox(
                height: AdaptSize.screenHeight * .024,
              ),

              /// password field
              textFormFields(
                maxLines: 1,
                obscureText: true,
                textInputAction: TextInputAction.done,
                textStyle: Theme.of(context).textTheme.bodyText1,
                label: "Password",
                controller: _passwordController,
                hintTexts: "********",
                validators: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),

              SizedBox(
                height: AdaptSize.screenHeight * .012,
              ),

              /// reset password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot your Password?",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  textButtonWidget(
                      foregroundColor: MyColor.darkBlueColor,
                      text: "Reset Passwords",
                      textStyle:
                          Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: MyColor.darkBlueColor,
                              ),
                      onPressed: () {})
                ],
              ),

              /// button login
              Consumer<LoginViewModel>(builder: (context, value, child) {
                return buttonWidget(
                  sizeheight: AdaptSize.screenHeight / 14,
                  sizeWidth: double.infinity,
                  borderRadius: BorderRadius.circular(10),
                  backgroundColor: MyColor.darkBlueColor,
                  onPressed: () async {
                    final is_valid = _formKey.currentState!.validate();
                    if (is_valid == false) {
                      return;
                    } else {
                      value.userLogin(context);
                    }
                  },
                  child: value.isLoading
                      ? LoadingWidget.whiteButtonLoading
                      : Text(
                          "Login",
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(color: MyColor.whiteColor),
                        ),
                );
              }),

              const Spacer(),

              Padding(
                padding: EdgeInsets.only(
                  bottom: AdaptSize.screenHeight * 0.088,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: richTextWidget(
                      text1: 'don\'t have an account yet? ',
                      textStyle1: Theme.of(context).textTheme.bodyMedium,
                      text2: 'Register',
                      textStyle2: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: MyColor.darkBlueColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          NavigasiViewModel().navigasiPop(context);
                        }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
