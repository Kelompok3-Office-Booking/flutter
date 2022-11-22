import 'package:auto_size_text/auto_size_text.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/widget/widget/text_button_widget.dart';
import 'package:betterspace/src/widget/widget/text_filed_widget.dart';
import 'package:flutter/material.dart';

enum genderEnum { male, female }

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  genderEnum radioGenderVal = genderEnum.male;
  @override
  Widget build(BuildContext context) {
    AdaptSize.size(context: context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(
                top: AdaptSize.screenHeight / 16.6,
                left: AdaptSize.screenWidth / 22.5,
                right: AdaptSize.screenWidth / 22.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(bottom: AdaptSize.screenHeight / 400),
                  child: AutoSizeText(
                    "Hi,",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: AdaptSize.screenHeight / 33.3),
                  child: AutoSizeText(
                    "let's register to use the app",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: AdaptSize.screenHeight / 72.7),
                        child: TextFormFields(
                          obscureText: false,
                          hintTexts: 'fullname',
                          label: 'Full name',
                          controller: emailController,
                          floatingLabelBehaviour: FloatingLabelBehavior.always,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: AdaptSize.screenHeight / 33.3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              "Gender",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: AdaptSize.screenWidth / 45),
                                  child: Row(
                                    children: [
                                      Radio<genderEnum>(
                                          value: genderEnum.male,
                                          groupValue: radioGenderVal,
                                          onChanged: ((genderEnum? value) {
                                            setState(() {
                                              radioGenderVal = value!;
                                            });
                                          })),
                                      AutoSizeText(
                                        "Male",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: AdaptSize.screenWidth / 45),
                                  child: Row(
                                    children: [
                                      Radio<genderEnum>(
                                          value: genderEnum.female,
                                          groupValue: radioGenderVal,
                                          onChanged: ((genderEnum? value) {
                                            setState(() {
                                              radioGenderVal = value!;
                                            });
                                          })),
                                      AutoSizeText(
                                        "Female",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: AdaptSize.screenHeight / 33.3),
                        child: TextFormFields(
                          obscureText: false,
                          hintTexts: 'example@gmail.com',
                          label: 'Email',
                          controller: emailController,
                          floatingLabelBehaviour: FloatingLabelBehavior.always,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: AdaptSize.screenHeight / 66.6),
                        child: TextFormFields(
                          maxLines: 1,
                          obscureText: true,
                          label: "Password",
                          controller: passwordController,
                          hintTexts: "Password",
                          floatingLabelBehaviour: FloatingLabelBehavior.always,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: AdaptSize.screenHeight / 66.6),
                        child: TextFormFields(
                          maxLines: 1,
                          obscureText: true,
                          label: "Confirm Password",
                          controller: confirmPasswordController,
                          hintTexts: "Confirm Password",
                          floatingLabelBehaviour: FloatingLabelBehavior.always,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: AdaptSize.screenHeight / 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AutoSizeText(
                        "I agree to the",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextButtonWidget(
                          text: "Terms & Conditions",
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.blue),
                          fontColor: Colors.blue,
                          onPressed: () {}),
                      AutoSizeText(
                        "that apply",
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: AdaptSize.screenHeight / 20,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: MyColor.darkBlueColor,
                          minimumSize: const Size.fromHeight(50)),
                      onPressed: () {},
                      child: AutoSizeText("Register",
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(color: MyColor.whiteColor))),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.only(bottom: AdaptSize.screenHeight / 16.6),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            "already have an account?",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          TextButtonWidget(
                              text: "Login",
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.blue),
                              fontColor: Colors.blue,
                              onPressed: () {
                                NavigasiViewModel()
                                    .navigasiToLoginScreen(context);
                              }),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
