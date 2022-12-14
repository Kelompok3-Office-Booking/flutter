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

  Future<Response> fetchProfile({required String accessTokens}) async {
    return await _dio.get(constantValue().userGetProfileEndpoint,
        options: Options(headers: {"Authorization": "Bearer " + accessTokens}));
  }

  Future<void> destroyUserSession() async {
    const secureStorage = FlutterSecureStorage();
    await secureStorage.deleteAll();
  }

  Future<void> refreshExpiredTokens() async {
    const secureStorage = FlutterSecureStorage();
    String? refreshToken = await secureStorage.read(key: "refresh_token_bs");
    if (refreshToken != null) {
      try {
        Response responses = await _dio.post(
          constantValue().userRefreshToken,
          options:
              Options(headers: {"Authorization": "Bearer " + refreshToken}),
        );
        print("response");
        if (responses.statusCode == 200 || responses.statusCode == 201) {
          print("refreshed");
          await secureStorage.write(
              key: "access_tokens_bs", value: responses.data["access_token"]);
          await secureStorage.write(
              key: "refresh_token_bs", value: responses.data["refresh_token"]);
        }
      } catch (e) {
        print(e.toString());
        destroyUserSession();
      }
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    const secureStorage = FlutterSecureStorage();
    String? accessTokens = await secureStorage.read(key: "access_tokens_bs");
    if (accessTokens != null) {
      final options = new Options(
          method: requestOptions.method,
          headers: {"Authorization": "Bearer " + accessTokens});
      return this._dio.request<dynamic>(requestOptions.path,
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
          options: options);
    } else {
      final options = new Options(
          method: requestOptions.method, headers: requestOptions.headers);
      return this._dio.request<dynamic>(requestOptions.path,
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
          options: options);
    }
  }

  Future<Response> fetchAllOffice({required String accessToken}) async {
    return _dio.get(
      constantValue().getAllOffice,
      options: Options(headers: {"Authorization": "Bearer " + accessToken}),
    );
  }

  Future<Response> fetchOfficeById(
      {required String officeId, required String accessToken}) async {
    return _dio.get(
      constantValue().getOfficeBaseUrl + officeId,
      options: Options(headers: {"Authorization": "Bearer " + accessToken}),
    );
  }

  Future<Response> fetchCoworkingSpace({required String accessToken}) async {
    return _dio.get(
      constantValue().getCoworkingSpaceOffice,
      options: Options(headers: {"Authorization": "Bearer " + accessToken}),
    );
  }

  Future<Response> fetchMeetingRoom({required String accessToken}) async {
    return _dio.get(
      constantValue().getMeetingRoomOffice,
      options: Options(headers: {"Authorization": "Bearer " + accessToken}),
    );
  }

  Future<Response> fetchOfficeRoom({required String accessToken}) async {
    return _dio.get(
      constantValue().getOfficeRoom,
      options: Options(headers: {"Authorization": "Bearer " + accessToken}),
    );
  }

  Future<Response> fetchOfficeByRecommendation(
      {required String accessToken}) async {
    return _dio.get(
      constantValue().getOfficeDataByRecommendation,
      options: Options(headers: {"Authorization": "Bearer " + accessToken}),
    );
  }

  Future<Response> fetchOfficeByCity(
      {required String accessToken, required String cityName}) async {
    return _dio.get(
      constantValue().getOfficeDataByCityBaseUrl + cityName,
      options: Options(headers: {"Authorization": "Bearer " + accessToken}),
    );
  }

  Future<Response> fetchOfficeByRate(
      {required String accessToken, required String officeRate}) async {
    return _dio.get(
      constantValue().getOfficeByRatingBaseUrl + officeRate,
      options: Options(headers: {"Authorization": "Bearer " + accessToken}),
    );
  }

  Future<Response> fetchOfficeByTitle(
      {required String accessToken, required String officeTitle}) async {
    return _dio.get(
      constantValue().getOfficeByTitleBaseUrl + officeTitle,
      options: Options(headers: {"Authorization": "Bearer " + accessToken}),
    );
  }

  Future<Response> fetchNearestOffice(
      {required String accessToken,
      required String formattedLocationRequest}) async {
    return _dio.get(
      constantValue().getNearestOfficeBaseUrl + formattedLocationRequest,
      options: Options(headers: {"Authorization": "Bearer " + accessToken}),
    );
  }
}
