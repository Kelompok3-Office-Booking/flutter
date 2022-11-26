import 'package:betterspace/src/model/data/onboarding_data.dart';
import 'package:betterspace/src/model/onboarding_model.dart';
import 'package:flutter/cupertino.dart';

class OnboardingViewModel with ChangeNotifier {
  final List<OnboardingModel> _onboardList = onboarding;

  List get onboardList => _onboardList;

  bool _lastPage = false;

  bool get lastPage => _lastPage;

  set lastPage(index) {
    _lastPage = index;
  }

  void getStarted(index) {
    _lastPage = index;
    notifyListeners();
  }
}
