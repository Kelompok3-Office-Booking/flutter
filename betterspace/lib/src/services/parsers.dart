//do custom parsing here

import 'package:betterspace/src/model/office_models/office_dummy_models.dart';
import 'package:betterspace/src/model/user_data/user_models.dart';
import 'package:betterspace/src/utils/custom_icons.dart';
import 'package:betterspace/src/utils/enums.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';

//helper & formatter parsers
//position to request string formatter
String positionRequestFormatter(
    {required String latitude, required String longitude}) {
  return "lat=" + latitude + "&long=" + longitude;
}

//gender enums to string parser
String genderEnumParsers(GenderEnum enumGenders) {
  return enumGenders == GenderEnum.male ? "male" : "female";
}

//api data parsers

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

OfficePricing officePricingParsers(
    {required String officeType, required double officePrice}) {
  return OfficePricing(
      officePrice: officePrice,
      officePriceUnits:
          officeType == "Coworking Space" || officeType == "Meeting Room"
              ? "hour"
              : "month",
      officePricingCurrency: "Rp");
}

List<OfficeFacilitiesModels> officeFacilitiesModelsParsers(
    {required List facilitiesModel}) {
  List<OfficeFacilitiesModels> listOfFacilities = [];

  facilitiesModel.forEach((element) {
    listOfFacilities.add(
      OfficeFacilitiesModels(
          facilitiesTitle: element["facilities_desc"],
          facilitiesIconSlug: element["facilities_slug"]),
    );
  });

  return listOfFacilities;
}

List<OfficeCapacityModels> officeCapacityParser(
    {required int capAccomodate,
    required int capWorkingDesk,
    required int capMeetingRoom,
    required int capPrivate_room}) {
  List<String> capacityType = [
    "accomodate",
    "working_desk",
    "meeting_room",
    "private_room"
  ];
  List<String> capacityTitle = [
    "Accomodate",
    "Working Desk",
    "Meeting Room",
    "Private Room"
  ];
  List<String> capacityUnits = ["person", "desk", "room", "room"];
  List<int> capacityValue = [
    capAccomodate,
    capWorkingDesk,
    capMeetingRoom,
    capPrivate_room
  ];
  List<OfficeCapacityModels> listOfCapacity = [];

  for (int index = 0; index < capacityValue.length; index++) {
    if (capacityValue[index] > 0) {
      listOfCapacity.add(
        OfficeCapacityModels(
            capacityIconSlug: capacityType[index],
            capacityTitle: capacityType[index],
            capacityValue: capacityValue[index].toDouble(),
            capacityUnits: capacityUnits[index]),
      );
    }
  }
  return listOfCapacity;
}

List<OfficeModels> officeModelParsers(List<dynamic> listOfficeJson) {
  var fakerInstance = new Faker();
  DateTime currDate = DateTime.now();
  String year = currDate.year.toString();
  String month = currDate.month.toString();
  String days = currDate.day.toString();
  List<OfficeModels> listOfOffice = [];
  listOfficeJson.forEach((jsonResponse) {
    listOfOffice.add(
      OfficeModels(
          officeID: jsonResponse["id"].toString(),
          officeName: jsonResponse["title"],
          officeType: jsonResponse["office_type"],
          officeLeadImage: jsonResponse["images"][1],
          officeGridImage: jsonResponse["images"],
          officeStarRating: jsonResponse["rate"].toDouble(),
          officeDescription: jsonResponse["description"],
          officeApproxDistance: jsonResponse["distance"].toDouble(),
          officeArea: jsonResponse["office_length"].toDouble(),
          officePersonCapacity: jsonResponse["accommodate"].toDouble(),
          officeOpenTime: DateTime.parse(year +
              "-" +
              month +
              "-" +
              days +
              " " +
              jsonResponse["open_hour"] +
              ":00"),
          officeCloseTime: DateTime.parse(year +
              "-" +
              month +
              "-" +
              days +
              " " +
              jsonResponse["close_hour"] +
              ":00"),
          officeLocation: OfficeLocation(
              city: jsonResponse["city"],
              district: jsonResponse["district"],
              officeLatitude: jsonResponse["lat"],
              officeLongitude: jsonResponse["lng"]),
          officePricing: officePricingParsers(
              officeType: jsonResponse["office_type"],
              officePrice: jsonResponse["price"].toDouble()),
          listOfOfficeCapcityModels: officeCapacityParser(
              capAccomodate: jsonResponse["accommodate"],
              capWorkingDesk: jsonResponse["working_desk"],
              capMeetingRoom: jsonResponse["meeting_room"],
              capPrivate_room: jsonResponse["private_room"]),
          listOfOfficeFacilitiesModels: officeFacilitiesModelsParsers(
              facilitiesModel: jsonResponse["facility_model"]),
          listOfOfficeReviewModels: [
            OfficeReviewModels(
                reviewerUserImage: Image.network(
                  fakerInstance.image.image(
                    keywords: ["people"],
                  ),
                ),
                reviewerUserName: fakerInstance.person.name(),
                reviewText: fakerInstance.lorem.sentence(),
                reviewDate: currDate,
                reviewStarsCount: 5,
                reviewHelpRateCount: 99 + 1 * 2),
          ]),
    );
  });

  return listOfOffice;
}

OfficeModels singleOfficeModelParser(Map<String, dynamic> jsonResponse) {
  var fakerInstance = new Faker();
  DateTime currDate = DateTime.now();
  String year = currDate.year.toString();
  String month = currDate.month.toString();
  String days = currDate.day.toString();
  return OfficeModels(
    officeID: jsonResponse["id"].toString(),
    officeName: jsonResponse["title"],
    officeType: jsonResponse["office_type"],
    officeLeadImage: jsonResponse["images"][1],
    officeGridImage: jsonResponse["images"],
    officeStarRating: jsonResponse["rate"].toDouble(),
    officeDescription: jsonResponse["description"],
    officeApproxDistance: jsonResponse["distance"].toDouble(),
    officeArea: jsonResponse["office_length"].toDouble(),
    officePersonCapacity: jsonResponse["accommodate"].toDouble(),
    officeOpenTime: DateTime.parse(year +
        "-" +
        month +
        "-" +
        days +
        " " +
        jsonResponse["open_hour"] +
        ":00"),
    officeCloseTime: DateTime.parse(year +
        "-" +
        month +
        "-" +
        days +
        " " +
        jsonResponse["close_hour"] +
        ":00"),
    officeLocation: OfficeLocation(
        city: jsonResponse["city"],
        district: jsonResponse["district"],
        officeLatitude: jsonResponse["lat"],
        officeLongitude: jsonResponse["lng"]),
    officePricing: officePricingParsers(
        officeType: jsonResponse["office_type"],
        officePrice: jsonResponse["price"].toDouble()),
    listOfOfficeCapcityModels: officeCapacityParser(
        capAccomodate: jsonResponse["accommodate"],
        capWorkingDesk: jsonResponse["working_desk"],
        capMeetingRoom: jsonResponse["meeting_room"],
        capPrivate_room: jsonResponse["private_room"]),
    listOfOfficeFacilitiesModels: officeFacilitiesModelsParsers(
        facilitiesModel: jsonResponse["facility_model"]),
    listOfOfficeReviewModels: [
      OfficeReviewModels(
          reviewerUserImage: Image.network(
            fakerInstance.image.image(
              keywords: ["people"],
            ),
          ),
          reviewerUserName: fakerInstance.person.name(),
          reviewText: fakerInstance.lorem.sentence(),
          reviewDate: currDate,
          reviewStarsCount: 5,
          reviewHelpRateCount: 99 + 1 * 2),
    ],
  );
}
