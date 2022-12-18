import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/utils/hex_color_convert.dart';
import 'package:betterspace/src/view_model/add_review_view_model.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/widget/dialog/response_dialog.dart';
import 'package:betterspace/src/widget/office_card_widget/card_detail_office_review.dart';
import 'package:betterspace/src/widget/widget/button_widget.dart';
import 'package:betterspace/src/widget/widget/default_appbar_widget.dart';
import 'package:betterspace/src/widget/widget/text_filed_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({Key? key}) : super(key: key);

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  final TextEditingController _addReviewDes = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _addReviewDes.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rantingProvider =
        Provider.of<AddReviewViewModel>(context, listen: false);
    return Scaffold(
      appBar: defaultAppbarWidget(
          contexts: context,
          isCenterTitle: false,
          titles: 'Add Review',
          leadIconFunction: () {
            context.read<NavigasiViewModel>().navigasiPop(context);
          }),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        padding: EdgeInsets.only(
          left: AdaptSize.screenWidth * .016,
          right: AdaptSize.screenWidth * .016,
          top: AdaptSize.screenHeight * .016,
        ),
        child: Column(
          children: [
            cardDetailOfficeReview(
              context: context,
              officeImage:
                  'https://cdn1-production-images-kly.akamaized.net/sBbpp2jnXav0YR8a_VVFjMtCCJQ=/1200x1200/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/882764/original/054263300_1432281574-Boruto-Naruto-the-Movie-trailer.jpg',
              officeRanting: '4.7',
              officeType: 'coworking space',
              officeName: 'Testing Office',
              officeLocation: 'Sebelah Alfamart',
            ),

            SizedBox(
              height: AdaptSize.screenHeight * .016,
            ),

            Text(
              'Your overall rating of the office ',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: AdaptSize.pixel15,
                  ),
            ),

            SizedBox(
              height: AdaptSize.screenHeight * .016,
            ),

            /// star ranting
            Consumer<AddReviewViewModel>(builder: (context, value, child) {
              return SizedBox(
                height: AdaptSize.screenWidth / 1000 * 120,
                width: double.infinity,
                child: Center(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: value.maximumRating,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: buildRatingStar(index, value.currentRating),
                          onTap: () {
                            value.changedRanting(index);
                          },
                        );
                      }),
                ),
              );
            }),

            SizedBox(
              height: AdaptSize.screenHeight * .016,
            ),

            /// text form field
            textFormFields(
                maxLines: 4,
                textInputAction: TextInputAction.done,
                controller: _addReviewDes,
                hintTexts: 'add a description',
                label: ''),

            SizedBox(
              height: AdaptSize.screenHeight * .016,
            ),

            buttonWidget(
              onPressed: () {
                debugPrint(
                    '${_addReviewDes.text}, ${rantingProvider.currentRating}');
                ResponseDialog.dialogSuccess(
                    context: context, description: 'Thank you !');
                Future.delayed(const Duration(seconds: 3), () {
                  context.read<NavigasiViewModel>().navigasiPop(context);
                  _addReviewDes.clear();
                });
              },
              sizeheight: AdaptSize.screenHeight / 14,
              sizeWidth: double.infinity,
              borderRadius: BorderRadius.circular(10),
              backgroundColor: MyColor.secondary400,
              child: Text(
                'Submit Review',
                style: Theme.of(context).textTheme.button!.copyWith(
                      fontSize: AdaptSize.pixel14,
                      color: MyColor.neutral900,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRatingStar(int index, int currentRating) {
    if (index < currentRating) {
      return Icon(
        Icons.star,
        color: HexColor('E5D11A'),
        size: AdaptSize.screenWidth / 1000 * 100,
      );
    } else {
      return Icon(
        Icons.star_border_outlined,
        color: MyColor.neutral700,
        size: AdaptSize.screenWidth / 1000 * 100,
      );
    }
  }
}
