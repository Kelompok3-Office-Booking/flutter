import 'package:betterspace/src/model/user_data/user_models.dart';
import 'package:betterspace/src/model/user_models/user_models_for_regist.dart';
import 'package:betterspace/src/services/constant.dart';
import 'package:dio/dio.dart';

class RegisterViewmodel {
  Future<Response> createUser({required UserModelForRegist userInfo}) async {
    late Response retrievedResponses;

    try {
      Response response = await Dio().post(
        constantValue().userRegisterEndpoint,
        data: {
          "full_name": userInfo.full_name,
          "gender": userInfo.gender,
          "email": userInfo.email,
          "password": userInfo.password,
          "confirmation_password": userInfo.confirmation_password
        },
      );

      print('User created: ${response.data}');

      retrievedResponses = response;
    } catch (e) {
      print('Error creating user: $e');
    }

    return retrievedResponses;
  }
}
