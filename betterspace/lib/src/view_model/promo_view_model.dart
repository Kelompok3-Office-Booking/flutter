import 'package:betterspace/src/model/data/promo_data.dart';
import 'package:betterspace/src/model/promo_model.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/widget/dialog/toast_allert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class PromoViewModel with ChangeNotifier {
  final List<PromoModel> _voucerPromo = promo;

  List<PromoModel> get voucerPromo => _voucerPromo;

  PromoModel findById(promoId) {
    return _voucerPromo.firstWhere((voucerId) => voucerId.id == promoId);
  }

  void changeCopyText(String text) async {
    Clipboard.setData(
      ClipboardData(text: text),
    ).then(
      (value) => toastAllert(
        msg: 'Copy Success',
        backgroundColor: MyColor.darkBlueColor,
      ),
    );
    notifyListeners();
  }
}
