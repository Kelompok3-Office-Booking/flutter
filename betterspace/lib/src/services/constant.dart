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
}
