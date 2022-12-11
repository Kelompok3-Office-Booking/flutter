import 'package:betterspace/src/model/user_data/user_models.dart';
import 'package:betterspace/src/services/api_services.dart';
import 'package:betterspace/src/services/constant.dart';
import 'package:betterspace/src/utils/enums.dart';
import 'package:betterspace/src/utils/parsers.dart';
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
  var _dio = Dio();

  logoutWithTokens() async {
    final _secureStorage = FlutterSecureStorage();
    String? _accessTokens = await _secureStorage.read(key: "access_tokens_bs");
    apiLogoutState = stateOfConnections.isStart;
    notifyListeners();
    if (_accessTokens != null) {
      try {
        apiLogoutState = stateOfConnections.isLoading;
        notifyListeners();
        Response logoutResponse = await _dio.post(
          constantValue().userLogoutWithToken,
          options: Options(headers: {"Authorization": "Bearer $_accessTokens"}),
        );
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
      Response responses = await UserService()
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
    if (accessTokens != null) {
      isUserExist = true;
      print("the user token is : $accessTokens");
      apiLoginState = stateOfConnections.isReady;
      notifyListeners();
    }
    notifyListeners();
  }

  getProfile() async {
    const secureStorage = FlutterSecureStorage();
    String? accessTokens = await secureStorage.read(key: "access_tokens_bs");
    if (accessTokens != null) {
      try {
        Response profResponse =
            await UserService().fetchProfile(tokens: userTokens!);
        print("fetch pertama : ${profResponse.statusCode}");

        if (profResponse.statusCode == 200) {
          userModels = userModelParser(profResponse.data, userTokens!);
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

  refreshToken() async {
    const secureStorage = FlutterSecureStorage();
    String? refreshToken = await secureStorage.read(key: "refresh_token_bs");
    if (refreshToken != null) {
      Response responses =
          await UserService().refreshExpiredTokens(refreshTokens: refreshToken);
      if (responses.statusCode == 200) {
        await secureStorage.write(
            key: "access_tokens_bs",
            value: responses.data["data"]["access_token"]);
        await secureStorage.write(
            key: "refresh_token_bs",
            value: responses.data["data"]["refresh_token"]);
      } else if (responses.statusCode == 401 || responses.statusCode == 403) {
        destroyActiveUser(secureStorage);
      } else {
        statusConnection = responses.statusCode.toString() +
            responses.statusMessage.toString();
      }
    } else {
      print("no active user");
    }
    notifyListeners();
  }

  destroyActiveUser(FlutterSecureStorage flutterStorage) async {
    await flutterStorage.deleteAll();
    userTokens = null;
    isUserExist = false;
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

  Future<Response<dynamic>> _retryRequest(
      {required RequestOptions requestOptions,
      required String newAcessTokens,
      required Dio dio}) async {
    final options = Options(
      method: requestOptions.method,
      headers: {"Authorization": "Bearer $newAcessTokens"},
    );
    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}