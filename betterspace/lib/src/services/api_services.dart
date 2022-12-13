//do api service here
import 'package:betterspace/src/model/user_data/user_models.dart';
import 'package:betterspace/src/services/constant.dart';
import 'package:betterspace/src/view_model/login_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserService {
  final _dio = Dio();

  UserService() {
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      return handler.next(options); //continue
    }, onResponse: (response, handler) {
      // Do something with response data
      return handler.next(response); // continue
    }, onError: (DioError e, handler) async {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        await refreshExpiredTokens();
        return handler.resolve(await _retry(e.requestOptions));
      }
      return handler.next(e);
    }));
  }

  Future<Response> loginUser(
      {required String userEmail, required String userPassword, tempo}) async {
    late Response apiResponse;

    try {
      // get token
      Response tokenResponse = await _dio.post(
        constantValue().userLoginEndpoint,
        data: {
          "email": userEmail,
          "password": userPassword,
        },
      );
      print('Auth Success: ${tokenResponse.data}');
      apiResponse = tokenResponse;
    } catch (e) {
      print("error" + '$e');
    }
    return apiResponse;
  }

  Future<Response> fetchProfile({required UserToken tokens}) async {
    return await _dio.get(constantValue().userGetProfileEndpoint,
        options: Options(
            headers: {"Authorization": "Bearer " + tokens.accessToken}));
  }

  Future<void> refreshExpiredTokens() async {
    const secureStorage = FlutterSecureStorage();
    String? refreshToken = await secureStorage.read(key: "refresh_token_bs");
    Response responses = await _dio.post(
      constantValue().userRefreshToken,
      options: Options(headers: {"Authorization": "Bearer " + refreshToken!}),
    );
    if (responses.statusCode == 200 || responses.statusCode == 201) {
      await secureStorage.write(
          key: "access_tokens_bs",
          value: responses.data["data"]["access_token"]);
      await secureStorage.write(
          key: "refresh_token_bs",
          value: responses.data["data"]["refresh_token"]);
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = new Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return this._dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  Future<Response> fetchAllOffice(String accessTokens) async {
    return _dio.get(
      constantValue().getAllOffice,
      options: Options(headers: {"Authorization": "Bearer " + accessTokens}),
    );
  }
}
