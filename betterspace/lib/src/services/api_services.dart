//do api service here
import 'package:betterspace/src/model/user_data/user_models.dart';
import 'package:betterspace/src/services/constant.dart';
import 'package:betterspace/src/view_model/login_viewmodel.dart';
import 'package:dio/dio.dart';

class UserService {
  final _dio = Dio();
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

  Future<Response> refreshExpiredTokens({required String refreshTokens}) async {
    late Response resultResponse;
    try {
      Response responses = await _dio.post(
        constantValue().userRefreshToken,
        options: Options(headers: {"Authorization": "Bearer " + refreshTokens}),
      );
      resultResponse = responses;
    } catch (e) {
      print("error : $e");
    }
    return resultResponse;
  }
}
