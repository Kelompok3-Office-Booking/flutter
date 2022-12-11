import 'package:betterspace/src/model/user_data/user_models.dart';
import 'package:betterspace/src/model/user_models/user_models_for_regist.dart';
import 'package:betterspace/src/services/constant.dart';
import 'package:betterspace/src/utils/enums.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class RegisterViewmodel with ChangeNotifier {
  String statusRegister = "-";
  Response? retrievedResponses;
  stateOfConnections connectionsState = stateOfConnections.isDoingNothing;

  createUser({required UserModelForRegist userInfo}) async {
    connectionsState = stateOfConnections.isStart;
    notifyListeners();
    try {
      connectionsState = stateOfConnections.isLoading;
      notifyListeners();
      Response responses = await Dio().post(
        constantValue().userRegisterEndpoint,
        data: {
          "full_name": userInfo.full_name,
          "gender": userInfo.gender,
          "email": userInfo.email,
          "password": userInfo.password,
          "confirmation_password": userInfo.confirmation_password
        },
      );

      if (responses.statusCode == 200) {
        statusRegister = responses.statusCode.toString();
        ;
        print('User created: ${responses.data}');
        retrievedResponses = responses;
        connectionsState = stateOfConnections.isReady;
        notifyListeners();
      } else {
        connectionsState = stateOfConnections.isFailed;
        statusRegister = responses.statusCode.toString();
        retrievedResponses = responses;
        notifyListeners();
      }
    } catch (e) {
      connectionsState = stateOfConnections.isFailed;
      statusRegister = e.toString();
      print('Error creating user: $e');
      notifyListeners();
    }
  }
}
