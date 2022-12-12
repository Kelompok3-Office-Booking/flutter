import 'package:betterspace/src/model/user_data/user_models.dart';
import 'package:betterspace/src/model/user_models/user_models_for_regist.dart';
import 'package:betterspace/src/services/constant.dart';
import 'package:betterspace/src/utils/enums.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class RegisterViewmodel with ChangeNotifier {
  int statusCodeRegister = 0;
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

      if (responses.statusCode == 200 || responses.statusCode == 201) {
        statusCodeRegister = responses.statusCode!;
        ;
        print('User created: ${responses.data}');
        retrievedResponses = responses;
        connectionsState = stateOfConnections.isReady;
        notifyListeners();
      } else if (responses.statusCode == 400) {
        connectionsState = stateOfConnections.isFailed;
        statusCodeRegister = 400;
        retrievedResponses = responses;
        notifyListeners();
      } else {
        connectionsState = stateOfConnections.isFailed;
        statusCodeRegister = responses.statusCode!;
        retrievedResponses = responses;
        notifyListeners();
      }
      connectionsState = stateOfConnections.isReady;
      notifyListeners();
    } catch (e) {
      connectionsState = stateOfConnections.isFailed;
      statusCodeRegister = 400;
      print('Error creating user: $e');
      notifyListeners();
    }
  }
}
