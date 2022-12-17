import 'package:betterspace/src/model/review_model/review_models.dart';
import 'package:betterspace/src/services/api_services.dart';
import 'package:betterspace/src/services/parsers.dart';
import 'package:betterspace/src/utils/enums.dart';
import 'package:betterspace/src/widget/dialog/response_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ReviewViewmodels with ChangeNotifier {
  stateOfConnections connectionState = stateOfConnections.isDoingNothing;

  List<ReviewModels> _listOfReviewByUser = [];
  List<ReviewModels> get listOfReviewUser => _listOfReviewByUser;

  createOfficeReviews(
      {required String reviewComment,
      required double rating,
      required int officeId}) async {
    connectionState = stateOfConnections.isStart;
    notifyListeners();
    const secureStorage = FlutterSecureStorage();
    String? accessTokens = await secureStorage.read(key: "access_tokens_bs");
    if (accessTokens != null) {
      print("user exist : $accessTokens");
      connectionState = stateOfConnections.isLoading;
      notifyListeners();
      try {
        Response response = await UserService().createOfficeReview(
            requestedReviewModel: ReviewModels(
                reviewComment: reviewComment,
                reviewRating: rating,
                reviewedOfficeId: officeId),
            accessToken: accessTokens);
        print(response);
        connectionState = stateOfConnections.isReady;
        notifyListeners();
      } catch (e) {
        connectionState = stateOfConnections.isFailed;
        notifyListeners();
        print(e.toString());
      }
    } else {
      connectionState = stateOfConnections.isFailed;
      notifyListeners();
    }
  }

  getReviewByUser() async {
    connectionState = stateOfConnections.isStart;
    notifyListeners();
    const secureStorage = FlutterSecureStorage();
    String? accessTokens = await secureStorage.read(key: "access_tokens_bs");
    if (accessTokens != null) {
      print("user exist : $accessTokens");
      connectionState = stateOfConnections.isLoading;
      notifyListeners();
      try {
        Response response =
            await UserService().getAllReviewByUser(accessToken: accessTokens);
        _listOfReviewByUser =
            listOfReviewModelParser(listOfResponse: response.data["data"]);
        connectionState = stateOfConnections.isReady;
        notifyListeners();
        print(_listOfReviewByUser);
      } catch (e) {
        print(e.toString());
      }
    } else {
      connectionState = stateOfConnections.isFailed;
      notifyListeners();
    }
  }
}
