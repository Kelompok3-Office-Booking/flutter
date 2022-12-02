import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/utils/enums.dart';
import 'package:betterspace/src/utils/form_validator.dart';
import 'package:betterspace/src/view_model/account_view_model.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/widget/widget/button_widget.dart';
import 'package:betterspace/src/widget/widget/loading_widget.dart';
import 'package:betterspace/src/widget/widget/text_filed_widget.dart';
import 'package:betterspace/src/widget/widget/transparent_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _editNameController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey();

  ValueNotifier<GenderEnum> radGenderVal =
      ValueNotifier<GenderEnum>(GenderEnum.male);

  @override
  void dispose() {
    super.dispose();
    _editNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: transparentAppbarWidget(
          context: context,
          titles: Text(
            'Edit Profile',
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

                /// form field
                textFormFields(
                  label: 'Full Name',
                  controller: _editNameController,
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: AdaptSize.screenHeight * .016),
                  validators: (value) => FormValidator.validateProfilName(
                    title: 'Name',
                    value1: _editNameController.text,
                  ),
                  hintTexts: 'Erick Cahya',
                  obscureText: false,
                  textInputAction: TextInputAction.done,
                ),

                SizedBox(
                  height: AdaptSize.screenHeight * .018,
                ),

                /// gender text
                Text(
                  "Gender",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                /// radio button
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
                const Spacer(),

                Consumer<AccountViewModel>(builder: (context, value, child) {
                  return buttonWidget(
                    sizeheight: AdaptSize.screenHeight / 14,
                    sizeWidth: double.infinity,
                    borderRadius: BorderRadius.circular(10),
                    backgroundColor: MyColor.darkBlueColor,
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        value.changeProfile(context,
                            'Your profile has been updated successfully!');
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

                SizedBox(
                  height: AdaptSize.screenHeight * .02,
                ),
              ],
            ),
          ),
        ));
  }
}
