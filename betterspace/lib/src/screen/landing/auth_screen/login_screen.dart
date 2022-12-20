import 'package:betterspace/src/services/page_validators.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/utils/enums.dart';
import 'package:betterspace/src/utils/form_validator.dart';
import 'package:betterspace/src/view_model/login_view_model.dart';
import 'package:betterspace/src/view_model/login_viewmodel.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/view_model/office_viewmodels.dart';
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
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AdaptSize.size(context: context);
    final providerOffice =
        Provider.of<OfficeViewModels>(context, listen: false);
    final providerClient = Provider.of<LoginViewmodels>(context, listen: false);
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
                keyboardType: TextInputType.emailAddress,
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
              Consumer<LoginViewModel>(builder: (context, value, child) {
                return textFormFields(
                  maxLines: 1,
                  obscureText: value.visiblePassword1 ? false : true,
                  suffixIcon: IconButton(
                    onPressed: () {
                      value.visiblePass1();
                    },
                    icon: value.visiblePassword1
                        ? Icon(
                            Icons.visibility_off,
                            color: MyColor.darkBlueColor,
                          )
                        : Icon(Icons.remove_red_eye,
                            color: MyColor.darkBlueColor),
                  ),
                  textInputAction: TextInputAction.done,
                  textStyle: Theme.of(context).textTheme.bodyText1,
                  label: "Password",
                  controller: _passwordController,
                  hintTexts: "********",
                  validators: (value) => FormValidator.singlePasswordValidator(
                    title: 'password',
                    value1: _passwordController.text,
                  ),
                );
              }),

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
              Consumer<LoginViewmodels>(builder: (context, logValue, child) {
                final logConsumerVal = logValue;
                return buttonWidget(
                  sizeheight: AdaptSize.screenHeight / 14,
                  sizeWidth: double.infinity,
                  borderRadius: BorderRadius.circular(10),
                  backgroundColor: MyColor.darkBlueColor,
                  onPressed: () async {
                    final isValid = _formKey.currentState!.validate();
                    if (isValid == false) {
                      return;
                    } else {
                      await providerClient.loginGetToken(
                          userEmail: _emailController.text,
                          userPassword: _passwordController.text);
                      logConsumerVal.apiLoginState =
                          stateOfConnections.isDoingNothing;
                      if (!mounted) return;

                      /// mengatasi build context across async gaps
                      nextScreen(logConsumerVal.isUserExist, context);

                      Future.delayed(Duration.zero, () {
                        providerClient.getProfile();
                        providerOffice.fetchAllOffice();
                        providerOffice.fetchCoworkingSpace();
                        providerOffice.fetchMeetingRoom();
                        providerOffice.fetchOfficeRoom();
                        providerOffice.fetchOfficeByRecommendation();
                      });
                    }
                  },
                  child: logConsumerVal.apiLoginState ==
                          stateOfConnections.isLoading
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
                  bottom: AdaptSize.screenHeight * .05,
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
                        ..onTap = () async {
                          NavigasiViewModel().navigasiToRegisterScreen(context);
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
