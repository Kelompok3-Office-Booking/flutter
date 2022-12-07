class UserToken {
  late String accessToken;
  late String? refreshToken;
  UserToken({required this.accessToken, required this.refreshToken});
}

class userProfileDetail {
  late String userName;
  late String userProfilePicture;
  late String userGender;
  userProfileDetail(
      {required this.userName,
      required this.userProfilePicture,
      required this.userGender});
}

class UserModel {
  late String userId;
  late String userEmail;
  late String userPassword;
  late userProfileDetail userProfileDetails;
  late UserToken userTokens;

  UserModel(
      {required this.userId,
      required this.userEmail,
      required this.userPassword,
      required this.userProfileDetails,
      required this.userTokens});
}
