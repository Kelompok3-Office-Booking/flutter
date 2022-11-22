import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/widget/widget/button_widget.dart';
import 'package:betterspace/src/widget/widget/text_button_widget.dart';
import 'package:betterspace/src/widget/widget/text_filed_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AdaptSize.size(context: context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                  child: Text(
                    "Welcome,",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: AdaptSize.screenHeight / 33.3),
                  child: Text(
                    "let's login to use the app",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
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
                          hintTexts: "********",
                          floatingLabelBehaviour: FloatingLabelBehavior.always,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot your Password?",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextButtonWidget(
                        text: "Reset Passwords",
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.blue),
                        fontColor: Colors.blue,
                        onPressed: () {})
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: AdaptSize.screenHeight / 33.3),
                  child: SizedBox(
                    height: AdaptSize.screenHeight / 20,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: MyColor.darkBlueColor,
                            minimumSize: const Size.fromHeight(50)),
                        onPressed: () {},
                        child: Text("Login",
                            style: Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(color: MyColor.whiteColor))),
                  ),
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
                          Text(
                            "don't have an account yet?",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          TextButtonWidget(
                              text: "Register",
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.blue),
                              fontColor: Colors.blue,
                              onPressed: () {
                                NavigasiViewModel()
                                    .navigasiToRegisterScreen(context);
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
