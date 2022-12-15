import 'package:betterspace/src/model/transaction_model/transaction_models.dart';
import 'package:betterspace/src/services/api_services.dart';
import 'package:betterspace/src/utils/enums.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TransactionViewmodels with ChangeNotifier {
  stateOfConnections connectionState = stateOfConnections.isDoingNothing;
  List allTransaction = [];

  createTransactionRecords(
      {required CreateTransactionModels requestedModels}) async {
    connectionState = stateOfConnections.isStart;
    notifyListeners();
    const secureStorage = FlutterSecureStorage();
    String? accessTokens = await secureStorage.read(key: "access_tokens_bs");
    if (accessTokens != null) {
      print("user exist : $accessTokens");
      try {
        Response createResponse = await UserService()
            .createTransactionRecordServices(requestedModels, accessTokens);
        if (createResponse.statusCode == 200 ||
            createResponse.statusCode == 201) {
          print(createResponse.toString());
        }
      } catch (e) {
        print("fail to make record : $e");
      }
    } else {
      print("no session exist");
    }
  }

  getTransactionByUser() async {
    connectionState = stateOfConnections.isStart;
    notifyListeners();
    const secureStorage = FlutterSecureStorage();
    String? accessTokens = await secureStorage.read(key: "access_tokens_bs");
    if (accessTokens != null) {
      print("user exist : $accessTokens");
    }
  }
}
