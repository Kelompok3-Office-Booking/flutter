class constantValue {
  //helper constant
  //---

  //api endpoint constant
  String baseUrl = "https://api-better-space-staging.herokuapp.com/api/v1/";

  //user endpoint
  String userRegisterEndpoint =
      "https://api-better-space-staging.herokuapp.com/api/v1/register";
  String userLoginEndpoint =
      "https://api-better-space-staging.herokuapp.com/api/v1/login";
  String userGetProfileEndpoint =
      "https://api-better-space-staging.herokuapp.com/api/v1/profile";
  String userRefreshToken =
      "https://api-better-space-staging.herokuapp.com/api/v1/refresh";
  String userLogoutWithToken =
      "https://api-better-space-staging.herokuapp.com/api/v1/logout";
  String userSetProfilePhoto =
      "https://api-better-space-staging.herokuapp.com/api/v1/profile/photo";
  String userChangeProfileData =
      "https://api-better-space-staging.herokuapp.com/api/v1/profile";
  String userDeleteAccount =
      "https://api-better-space-staging.herokuapp.com/api/v1/profile";

  //office endpoint
  String getAllOffice =
      "https://api-better-space-staging.herokuapp.com/api/v1/offices/all";
  String getCoworkingSpaceOffice =
      "https://api-better-space-staging.herokuapp.com/api/v1/offices/type/coworking-space";
  String getMeetingRoomOffice =
      "https://api-better-space-staging.herokuapp.com/api/v1/offices/type/meeting-room";
  String getOfficeRoom =
      "https://api-better-space-staging.herokuapp.com/api/v1/offices/type/office";
  String getOfficeDataByRecommendation =
      "https://api-better-space-staging.herokuapp.com/api/v1/offices/recommendation";

  //get  office by request variable
  String getOfficeBaseUrl =
      "https://api-better-space-staging.herokuapp.com/api/v1/offices/";
  String getOfficeDataByCityBaseUrl =
      "https://api-better-space-staging.herokuapp.com/api/v1/offices/city/";
  String getOfficeByRatingBaseUrl =
      "https://api-better-space-staging.herokuapp.com/api/v1/offices/rate/";
  String getOfficeByTitleBaseUrl =
      "https://api-better-space-staging.herokuapp.com/api/v1/offices/title?search=";
  String getNearestOfficeBaseUrl =
      "https://api-better-space-staging.herokuapp.com/api/v1/offices/nearest?";

  //Transaction Endpoint
  String createTransactionRecord =
      "https://api-better-space-staging.herokuapp.com/api/v1/transactions/details";
  String getAllTransactionByUser =
      "https://api-better-space-staging.herokuapp.com/api/v1/transactions";
  String getTransactionDetails =
      "https://api-better-space-staging.herokuapp.com/api/v1/transactions/details/";

  //cancel endpoint need o be tampered with transactionId/cancel
  String cancelTransactionByIdBaseUrl =
      "https://api-better-space-staging.herokuapp.com/api/v1/transactions/details/";

  String gmapApiKey = 'AIzaSyA1MgLuZuyqR_OGY3ob3M52N46TDBRI_9k';
}
