import 'package:betterspace/src/model/user_whislist/user_whislist.dart';
import 'package:flutter/cupertino.dart';

class WhislistViewModel with ChangeNotifier {
  final List<UserWhislistModel> _whislist = [];

  get whislist => _whislist;

  bool onTaped = false;

  /// add item list
  void addWhistlistOffice(UserWhislistModel userWhislist) {
    onTaped = !onTaped;
    _whislist.add(userWhislist);
    notifyListeners();
  }

  /// delete list
  void removeWhislistOffice(int index) {
    onTaped = false;
    _whislist.removeAt(index);
    notifyListeners();
  }

  void handleOnTap({
    required UserWhislistModel userWhislist,
    required int removeIndex,
  }) {
    if (onTaped == true) {
      addWhistlistOffice(userWhislist);
    } else if (onTaped == false) {
      removeWhislistOffice(removeIndex);
    }
    notifyListeners();
  }
}
