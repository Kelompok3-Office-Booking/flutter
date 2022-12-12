//do custom parsing here
import 'package:betterspace/src/model/user_data/user_models.dart';
import 'package:betterspace/src/utils/enums.dart';

String genderEnumParsers(GenderEnum enumGenders) {
  return enumGenders == GenderEnum.male ? "male" : "female";
}

UserModel userModelParser(
    Map<String, dynamic> profResponse, UserToken userTokens) {
  return UserModel(
    userId: profResponse["data"]["id"].toString(),
    userEmail: profResponse["data"]["email"],
    userProfileDetails: UserProfileDetail(
        userName: profResponse["data"]["full_name"],
        userProfilePicture: profResponse["data"]["photo"],
        userGender: profResponse["data"]["gender"]),
    userTokens: userTokens,
  );
}
