import 'package:betterspace/src/model/data/promo_data.dart';
import 'package:betterspace/src/model/promo_model.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/widget/dialog/response_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PromoViewModel with ChangeNotifier {
  final List<PromoModel> _voucerPromo = promo;

  List<PromoModel> get voucerPromo => _voucerPromo;

  PromoModel findById(promoId) {
    return _voucerPromo.firstWhere((voucerId) => voucerId.id == promoId);
  }

  void changeCopyText(context, String text) async {
    Clipboard.setData(
      ClipboardData(text: text),
    ).then(
      (value) => ResponseDialog.dialogSuccess(
          context: context, description: 'Copy success'),
    );
    notifyListeners();
  }

  get promoMenu => _promoMenu;
  final List _promoMenu = [
    [
      Icon(
        Icons.gavel,
        size: AdaptSize.pixel22,
      ),
      'Term and Condition',
      Icon(
        Icons.arrow_forward_ios_rounded,
        size: AdaptSize.pixel22,
        color: MyColor.neutral500,
      ),
    ],
    [
      Icon(
        Icons.help_outline,
        size: AdaptSize.pixel22,
      ),
      'How to',
      Icon(
        Icons.arrow_forward_ios_rounded,
        size: AdaptSize.pixel22,
        color: MyColor.neutral500,
      ),
    ],
    [
      Icon(
        Icons.description_outlined,
        size: AdaptSize.pixel22,
      ),
      'Description',
      Icon(
        Icons.arrow_forward_ios_rounded,
        size: AdaptSize.pixel22,
        color: MyColor.neutral500,
      ),
    ],
  ];

}
