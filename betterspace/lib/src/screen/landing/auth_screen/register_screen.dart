import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/utils/enums.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/widget/widget/button_widget.dart';
import 'package:betterspace/src/widget/widget/rich_text_widget.dart';
import 'package:betterspace/src/widget/widget/text_filed_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  ValueNotifier<GenderEnum> radGenderVal =
      ValueNotifier<GenderEnum>(GenderEnum.male);

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _fullnameController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AdaptSize.size(context: context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
              top: AdaptSize.paddingTop,
              left: AdaptSize.screenWidth / 22.5,
              right: AdaptSize.screenWidth / 22.5),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(bottom: AdaptSize.screenHeight / 400),
                  child: Text(
                    "Hi,",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: AdaptSize.screenHeight / 33.3),
                  child: Text(
                    "let's register to use the app",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: AdaptSize.screenHeight / 72.7),
                  child: textFormFields(
                    textInputAction: TextInputAction.done,
                    obscureText: false,
                    hintTexts: 'fullname',
                    label: 'Full Name',
                    controller: _fullnameController,
                  ),
                ),

                SizedBox(
                  height: AdaptSize.screenHeight * .011,
                ),

                /// gender text
                Text(
                  "Gender",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                /// gender radio button
                Row(
                  children: [
                    /// male value
                    ValueListenableBuilder<GenderEnum>(
                      valueListenable: radGenderVal,
                      builder: ((context, values, child) {
                        return Radio<GenderEnum>(
                          activeColor: Colors.deepPurple.shade600,
                          value: GenderEnum.male,
                          groupValue: values,
                          onChanged: ((value) {
                            radGenderVal.value = value!;
                          }),
                        );
                      }),
                    ),
                    Text(
                      "Male",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),

                    /// feemale value
                    ValueListenableBuilder<GenderEnum>(
                      valueListenable: radGenderVal,
                      builder: ((context, values, child) {
                        return Radio<GenderEnum>(
                          activeColor: Colors.deepPurple.shade600,
                          value: GenderEnum.female,
                          groupValue: values,
                          onChanged: ((value) {
                            radGenderVal.value = value!;
                          }),
                        );
                      }),
                    ),
                    Text(
                      "Female",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),

                SizedBox(
                  height: AdaptSize.screenHeight * .024,
                ),

                /// email field
                textFormFields(
                  textInputAction: TextInputAction.done,
                  obscureText: false,
                  hintTexts: 'example@gmail.com',
                  label: 'Email',
                  controller: _emailController,
                ),

                SizedBox(
                  height: AdaptSize.screenHeight * .024,
                ),

                /// password field
                textFormFields(
                  textInputAction: TextInputAction.done,
                  maxLines: 1,
                  obscureText: true,
                  label: "Password",
                  controller: _passwordController,
                  hintTexts: "Password",
                ),

                SizedBox(
                  height: AdaptSize.screenHeight * .024,
                ),

                /// confrim password field
                textFormFields(
                  textInputAction: TextInputAction.done,
                  maxLines: 1,
                  obscureText: true,
                  label: "Confirm Password",
                  controller: _confirmPasswordController,
                  hintTexts: "Confirm Password",
                ),

                SizedBox(
                  height: AdaptSize.screenHeight * .024,
                ),

                /// terms and conditions
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding:
                        EdgeInsets.only(bottom: AdaptSize.screenHeight / 100),
                    child: richTextWidget(
                      text1: 'I agree to the ',
                      textStyle1: Theme.of(context).textTheme.bodySmall,
                      text2: 'Terms & Conditions ',
                      textStyle2: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: MyColor.darkBlueColor),
                      text3: 'that apply',
                      textStyle3: Theme.of(context).textTheme.bodySmall,
                      recognizer: TapGestureRecognizer()
                        ..onTap = (() {
                          NavigasiViewModel()
                              .navigasiToTermsAndConditionScreen(context);
                        }),
                    ),
                  ),
                ),

                /// button register
                buttonWidget(
                  sizeheight: AdaptSize.screenHeight / 14,
                  sizeWidth: double.infinity,
                  borderRadius: BorderRadius.circular(10),
                  backgroundColor: MyColor.darkBlueColor,
                  onPressed: () {},
                  child: Text(
                    "Register",
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(color: MyColor.whiteColor),
                  ),
                ),

                /// button to login screen
                Padding(
                  padding: EdgeInsets.only(
                    bottom: AdaptSize.screenHeight * 0.048,
                    top: AdaptSize.screenHeight * 0.1,
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: richTextWidget(
                        text1: 'already have an account? ',
                        textStyle1: Theme.of(context).textTheme.bodyMedium,
                        text2: 'Login',
                        textStyle2: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: MyColor.darkBlueColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            NavigasiViewModel().navigasiToLoginScreen(context);
                          }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
