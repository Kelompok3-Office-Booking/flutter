import 'dart:html';

import 'package:betterspace/src/model/user_data/user_models.dart';
import 'package:betterspace/src/services/api_services.dart';
import 'package:betterspace/src/services/constant.dart';
import 'package:betterspace/src/utils/enums.dart';
import 'package:betterspace/src/services/parsers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginViewmodels with ChangeNotifier {
  UserModel? userModels;
  UserToken? userTokens;
  bool isUserExist = false;
  String statusConnection = "-";
  String logoutStatusCode = "-";
  stateOfConnections apiLoginState = stateOfConnections.isDoingNothing;
  stateOfConnections apiProfileState = stateOfConnections.isDoingNothing;
  stateOfConnections apiLogoutState = stateOfConnections.isDoingNothing;
  stateOfConnections profileSetterConnectionState =
      stateOfConnections.isDoingNothing;
  var _dio = Dio();

  logoutWithTokens() async {
    final _secureStorage = FlutterSecureStorage();
    String? accessTokens = await _secureStorage.read(key: "access_tokens_bs");
    apiLogoutState = stateOfConnections.isStart;
    notifyListeners();
    if (accessTokens != null) {
      try {
        apiLogoutState = stateOfConnections.isLoading;
        notifyListeners();
        Response logoutResponse = await UserService()
            .logoutWithTokensServices(accessTokens: accessTokens);
        apiLogoutState = stateOfConnections.isReady;
        notifyListeners();
        if (logoutResponse.statusCode == 200) {
          logoutStatusCode = logoutResponse.statusCode.toString();
          notifyListeners();
          destroyActiveUser(_secureStorage);
          print(logoutResponse.statusCode.toString() + "success status");
        }
      } catch (e) {
        print("error : $e");
        logoutStatusCode = e.toString();

        apiLogoutState = stateOfConnections.isFailed;
        notifyListeners();
      }
    }
    notifyListeners();
  }

  loginGetToken({required userEmail, required userPassword}) async {
    const secureStorage = FlutterSecureStorage();
    apiLoginState = stateOfConnections.isStart;
    notifyListeners();
    try {
      apiLoginState = stateOfConnections.isLoading;
      notifyListeners();
      Response responses = await SignService()
          .loginUser(userEmail: userEmail, userPassword: userPassword);
      print("success login" + "$responses");

      if (responses.statusCode == 200) {
        if (responses.data["access_token"] != null) {
          userTokens = UserToken.fromJson(responses.data);
          await secureStorage.write(
              key: "access_tokens_bs", value: responses.data["access_token"]);
          await secureStorage.write(
              key: "refresh_token_bs", value: responses.data["refresh_token"]);
        }
      }
      await validateTokenIsExist();
    } catch (e) {
      statusConnection = e.toString();
      print("error on" + '$e');
    }
    notifyListeners();
  }

  validateTokenIsExist() async {
    const secureStorage = FlutterSecureStorage();
    String? accessTokens = await secureStorage.read(key: "access_tokens_bs");
    String? refreshTokens = await secureStorage.read(key: "refresh_token_bs");
    print("check user session");

    if (accessTokens != null && refreshTokens != null) {
      userTokens =
          UserToken(accessToken: accessTokens, refreshToken: refreshTokens);
      isUserExist = true;
      print("the user token is : $accessTokens");
      apiLoginState = stateOfConnections.isReady;
      notifyListeners();
    } else {
      print("no user session exist");
    }
    notifyListeners();
  }

  getProfile() async {
    const secureStorage = FlutterSecureStorage();
    String? accessTokens = await secureStorage.read(key: "access_tokens_bs");
    String? refreshTokens = await secureStorage.read(key: "refresh_token_bs");
    if (accessTokens != null) {
      try {
        Response profResponse =
            await UserService().fetchProfile(accessTokens: accessTokens);
        print("fetch pertama : ${profResponse.statusCode}");

        if (profResponse.statusCode == 200) {
          userModels = userModelParser(
              profResponse.data,
              UserToken(
                  accessToken: accessTokens, refreshToken: refreshTokens));
          print(profResponse.data["data"]['email'] + "fetch success");
        }
      } catch (e) {
        print("error: $e");
      }
    } else {
      print("no active user");
    }
    notifyListeners();
  }

  setUserProfilePicture(
      {required String filePath, required String fileName}) async {
    profileSetterConnectionState = stateOfConnections.isStart;
    notifyListeners();
    const secureStorage = FlutterSecureStorage();
    String? accessTokens = await secureStorage.read(key: "access_tokens_bs");
    if (accessTokens != null) {
      print("user exist : $accessTokens");
      profileSetterConnectionState = stateOfConnections.isLoading;
      notifyListeners();

      Response response = await UserService().setProfilePicture(
          filePath: filePath, fileName: fileName, accessToken: accessTokens);
    }
  }

  destroyActiveUser(FlutterSecureStorage flutterStorage) async {
    await flutterStorage.deleteAll();
    userTokens = null;
    isUserExist = false;
    userModels = null;
    notifyListeners();
  }

  resetLoginConnectionState() {
    apiLoginState = stateOfConnections.isDoingNothing;
    notifyListeners();
  }

  resetProfileFetchConnectionState() {
    apiProfileState = stateOfConnections.isDoingNothing;
    notifyListeners();
  }
}
