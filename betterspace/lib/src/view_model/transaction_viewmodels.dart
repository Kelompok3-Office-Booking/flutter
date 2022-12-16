import 'package:betterspace/src/model/office_models/office_dummy_models.dart';
import 'package:betterspace/src/model/transaction_model/transaction_models.dart';
import 'package:betterspace/src/model/user_data/user_models.dart';
import 'package:betterspace/src/services/api_services.dart';
import 'package:betterspace/src/services/parsers.dart';
import 'package:betterspace/src/utils/enums.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TransactionViewmodels with ChangeNotifier {
  stateOfConnections connectionState = stateOfConnections.isDoingNothing;
  List<UserTransaction> _allTransaction = [];
  List<UserTransaction> get allTransaction => _allTransaction;
  UserTransaction? singleUserTransaction;

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

  getTransactionByUser(
      {required UserModel userModels,
      required List<OfficeModels> ListOfAllOffice}) async {
    connectionState = stateOfConnections.isStart;
    notifyListeners();
    const secureStorage = FlutterSecureStorage();
    String? accessTokens = await secureStorage.read(key: "access_tokens_bs");
    if (accessTokens != null) {
      print("user exist : $accessTokens");
      connectionState = stateOfConnections.isLoading;
      notifyListeners();
      try {
        Response response = await UserService()
            .getUserTransactionServices(accessToken: accessTokens);
        _allTransaction = listedUserTransactionParser(
            requestedResponses: response.data["data"],
            requestedUserModel: userModels,
            listOfOfficeModels: ListOfAllOffice);
        notifyListeners();

        print(_allTransaction[1].bookingId);
        connectionState = stateOfConnections.isReady;
        notifyListeners();
      } catch (e) {
        connectionState = stateOfConnections.isFailed;
        notifyListeners();
        print("error get transaction data by user : $e");
      }
    } else {
      connectionState = stateOfConnections.isFailed;
      notifyListeners();
    }
  }

  getTransactionDetail(
      {required UserModel userModels,
      required List<OfficeModels> ListOfAllOffice,
      required String requestedId}) async {
    connectionState = stateOfConnections.isStart;
    notifyListeners();
    const secureStorage = FlutterSecureStorage();
    String? accessTokens = await secureStorage.read(key: "access_tokens_bs");
    if (accessTokens != null) {
      print("user exist : $accessTokens");
      connectionState = stateOfConnections.isLoading;
      notifyListeners();
      try {
        Response response = await UserService()
            .getUserTransactionDetailByIdServices(
                accessToken: accessTokens, requestedID: requestedId);
        print(response);
        singleUserTransaction = userTransactionParsers(
            jsonResponse: response.data["data"],
            requestedUserModel: userModels,
            listOfficeModels: ListOfAllOffice);
        notifyListeners();

        print(singleUserTransaction?.bookingId);
        connectionState = stateOfConnections.isReady;
        notifyListeners();
      } catch (e) {
        connectionState = stateOfConnections.isFailed;
        notifyListeners();
        print("error get transaction data by user : $e");
      }
    } else {
      connectionState = stateOfConnections.isFailed;
      notifyListeners();
    }
  }
}
