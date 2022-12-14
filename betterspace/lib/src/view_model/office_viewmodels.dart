import 'package:betterspace/src/model/office_models/office_dummy_models.dart';
import 'package:betterspace/src/services/api_services.dart';
import 'package:betterspace/src/services/parsers.dart';
import 'package:betterspace/src/utils/enums.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class OfficeViewModels with ChangeNotifier {
  bool isUserExist = true;
  stateOfConnections connectionState = stateOfConnections.isDoingNothing;
  List<OfficeModels> _listOfAllOfficeModels = [];
  List<OfficeModels> get listOfAllOfficeModels => _listOfAllOfficeModels;

  fetchAllOffice() async {
    connectionState = stateOfConnections.isStart;
    notifyListeners();
    const secureStorage = FlutterSecureStorage();
    String? accessTokens = await secureStorage.read(key: "access_tokens_bs");
    if (accessTokens != null) {
      connectionState = stateOfConnections.isLoading;
      notifyListeners();
      try {
        Response getResponse = await UserService().fetchAllOffice(accessTokens);

        if (getResponse.statusCode == 200) {
          print(getResponse.statusCode);
          _listOfAllOfficeModels = officeModelParsers(getResponse.data["data"]);
          notifyListeners();
          isUserExist = true;
          notifyListeners();
          connectionState = stateOfConnections.isReady;
          notifyListeners();
        }
      } catch (e) {
        connectionState = stateOfConnections.isFailed;
        print("error : $e");
        notifyListeners();
      }
    } else {
      isUserExist = false;
    }
  }

  destroyDataWhenlogout() async {
    final _secureStorage = FlutterSecureStorage();
    String? _accessTokens = await _secureStorage.read(key: "access_tokens_bs");
    if (_accessTokens != null) {
      print("not destroyed");
      print(_accessTokens);
      return;
    } else {
      print("destroyed");
      isUserExist = false;
      notifyListeners();
      _listOfAllOfficeModels = [];
      notifyListeners();
    }
  }
}
