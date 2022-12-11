import 'package:betterspace/src/utils/enums.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class LoginViewModel with ChangeNotifier {
  bool _isLoading = false;
  get isLoading => _isLoading;
  void userLogin(context) async {
    _isLoading = !_isLoading;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 3));
    _isLoading = false;
    notifyListeners();
    Provider.of<NavigasiViewModel>(context, listen: false)
        .navigasiToMenuScreen(context);
  }
}
