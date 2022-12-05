class UserToken {
  late String activeToken;
  late String refreshToken;
}

class userProfileDetail {
  late String userName;
  late String userProfilePicture;
  late String userGender;
}

class UserModel {
  late String userId;
  late String userEmail;
  late String userPassword;
  late userProfileDetail userProfileDetails;
  late UserToken userTokens;
}
