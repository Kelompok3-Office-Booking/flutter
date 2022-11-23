import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/utils/enums.dart';

import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/widget/widget/text_button_widget.dart';
import 'package:betterspace/src/widget/widget/text_filed_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
  GenderEnum _radioGenderVal = GenderEnum.male;
  @override
  Widget build(BuildContext context) {
    AdaptSize.size(context: context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
            top: AdaptSize.screenHeight / 16.6,
            left: AdaptSize.screenWidth / 22.5,
            right: AdaptSize.screenWidth / 22.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: AdaptSize.screenHeight / 400),
              child: Text(
                "Hi,",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: AdaptSize.screenHeight / 33.3),
              child: Text(
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
                    padding:
                        EdgeInsets.only(bottom: AdaptSize.screenHeight / 72.7),
                    child: TextFormFields(
                      textInputAction: TextInputAction.done,
                      obscureText: false,
                      hintTexts: 'fullname',
                      label: 'Full name',
                      controller: fullnameController,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: AdaptSize.screenHeight / 33.3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
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
                                  Radio<GenderEnum>(
                                      value: GenderEnum.male,
                                      groupValue: _radioGenderVal,
                                      onChanged: ((GenderEnum? value) {
                                        setState(() {
                                          _radioGenderVal = value!;
                                        });
                                      })),
                                  Text(
                                    "Male",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: AdaptSize.screenWidth / 45),
                              child: Row(
                                children: [
                                  Radio<GenderEnum>(
                                      value: GenderEnum.female,
                                      groupValue: _radioGenderVal,
                                      onChanged: ((GenderEnum? value) {
                                        setState(() {
                                          _radioGenderVal = value!;
                                        });
                                      })),
                                  Text(
                                    "Female",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
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
                    padding:
                        EdgeInsets.only(bottom: AdaptSize.screenHeight / 33.3),
                    child: TextFormFields(
                      textInputAction: TextInputAction.done,
                      obscureText: false,
                      hintTexts: 'example@gmail.com',
                      label: 'Email',
                      controller: emailController,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: AdaptSize.screenHeight / 66.6),
                    child: TextFormFields(
                      textInputAction: TextInputAction.done,
                      maxLines: 1,
                      obscureText: true,
                      label: "Password",
                      controller: passwordController,
                      hintTexts: "Password",
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: AdaptSize.screenHeight / 66.6),
                    child: TextFormFields(
                      textInputAction: TextInputAction.done,
                      maxLines: 1,
                      obscureText: true,
                      label: "Confirm Password",
                      controller: confirmPasswordController,
                      hintTexts: "Confirm Password",
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(bottom: AdaptSize.screenHeight / 100),
                child: RichText(
                  text: TextSpan(
                    text: "I agree to the ",
                    style: Theme.of(context).textTheme.bodySmall,
                    children: <TextSpan>[
                      TextSpan(
                        text: "Terms & Conditions ",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = (() {
                            NavigasiViewModel()
                                .navigasiToTermsAndConditionScreen(context);
                          }),
                      ),
                      TextSpan(
                        text: "that apply",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AdaptSize.screenHeight / 20,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MyColor.darkBlueColor,
                      minimumSize: const Size.fromHeight(50)),
                  onPressed: () {},
                  child: Text("Register",
                      style: Theme.of(context)
                          .textTheme
                          .button!
                          .copyWith(color: MyColor.whiteColor))),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: AdaptSize.screenHeight / 16.6),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
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
                            NavigasiViewModel().navigasiToLoginScreen(context);
                          }),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
