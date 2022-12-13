import 'package:betterspace/src/model/office_models/office_dummy_models.dart';
import 'package:betterspace/src/services/api_services.dart';
import 'package:betterspace/src/services/parsers.dart';
import 'package:betterspace/src/utils/enums.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class OfficeViewModels with ChangeNotifier {
  //when isUserExist true OfficeViewModels can contain data, when false all office model data will be destroyed
  bool isUserExist = true;

  //stateOfConnection used for letting loading UI know when it should display loading animation, when to stops
  stateOfConnections connectionState = stateOfConnections.isDoingNothing;

  //List of All ofice models
  List<OfficeModels> _listOfAllOfficeModels = [];
  List<OfficeModels> get listOfAllOfficeModels => _listOfAllOfficeModels;

  //office models result from fetchOfficeById
  OfficeModels? _officeModelById;
  OfficeModels? get officeModelById => _officeModelById;

  fetchAllOffice() async {
    connectionState = stateOfConnections.isStart;
    notifyListeners();
    const secureStorage = FlutterSecureStorage();
    String? accessTokens = await secureStorage.read(key: "access_tokens_bs");
    if (accessTokens != null) {
      connectionState = stateOfConnections.isLoading;
      notifyListeners();
      try {
        Response getResponse =
            await UserService().fetchAllOffice(accessToken: accessTokens);

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
      connectionState = stateOfConnections.isFailed;
      isUserExist = false;
      notifyListeners();
    }
  }

  fetchOfficeById({required String officeId}) async {
    connectionState = stateOfConnections.isStart;
    notifyListeners();
    const secureStorage = FlutterSecureStorage();
    String? accessTokens = await secureStorage.read(key: "access_tokens_bs");

    //start fetching
    if (accessTokens != null) {
      connectionState = stateOfConnections.isLoading;
      notifyListeners();
      try {
        Response getResponse = await UserService()
            .fetchOfficeById(officeId: officeId, accessToken: accessTokens);

        if (getResponse.statusCode == 200) {
          print(getResponse.statusCode);
          print(getResponse.data["data"]);
          _officeModelById = singleOfficeModelParser(getResponse.data["data"]);
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
