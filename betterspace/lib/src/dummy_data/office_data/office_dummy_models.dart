import 'package:flutter/material.dart';

class OfficeCapacityModels {
  late Icon capacityIcon;
  late String capacityTitle;
  late double capacityValue;
  late String capacityUnits;
  OfficeCapacityModels(
      {required this.capacityIcon,
      required this.capacityTitle,
      required this.capacityValue,
      required this.capacityUnits});
}

class OfficeFacilitiesModels {
  late Icon facilitiesIcon;
  late String facilitiesTitle;
  OfficeFacilitiesModels(
      {required this.facilitiesIcon, required this.facilitiesTitle});
}

class OfficeReviewModels {
  late Image reviewerUserImage;
  late String reviewerUserName;
  late String reviewText;
  late DateTime reviewDate;
  late int reviewStarsCount;
  late int reviewHelpRateCount;
  OfficeReviewModels(
      {required this.reviewerUserImage,
      required this.reviewerUserName,
      required this.reviewText,
      required this.reviewDate,
      required this.reviewStarsCount,
      required this.reviewHelpRateCount});
}

class OfficeLocation {
  late String city;
  late String district;
  late double officeLatitude;
  late double officeLongitude;
  OfficeLocation(
      {required this.city,
      required this.district,
      required this.officeLatitude,
      required this.officeLongitude});
}

class OfficePricing {
  late double officePrice;
  late String officePriceUnits;
  late String officePricingCurrency;
  OfficePricing(
      {required this.officePrice,
      required this.officePriceUnits,
      required this.officePricingCurrency});
}

class OfficeModels {
  late String officeID;
  late String officeName;
  late String officeType;
  late String officeLeadImage;
  late int officeStarRating;
  late String officeDescription;
  late double officeApproxDistance;
  late double officeArea;
  late double officePersonCapacity;
  late DateTime officeOpenTime;
  late DateTime officeCloseTime;
  late OfficeLocation officeLocation;
  late OfficePricing officePricing;
  List<String> officeGridImage = [];
  List<OfficeCapacityModels> listOfOfficeCapcityModels = [];
  List<OfficeFacilitiesModels> listOfOfficeFacilitiesModels = [];
  List<OfficeReviewModels> listOfOfficeReviewModels = [];

  OfficeModels({
    required this.officeID,
    required this.officeName,
    required this.officeType,
    required this.officeLeadImage,
    required this.officeGridImage,
    required this.officeStarRating,
    required this.officeDescription,
    required this.officeApproxDistance,
    required this.officeArea,
    required this.officePersonCapacity,
    required this.officeOpenTime,
    required this.officeCloseTime,
    required this.officeLocation,
    required this.officePricing,
    required this.listOfOfficeCapcityModels,
    required this.listOfOfficeFacilitiesModels,
    required this.listOfOfficeReviewModels,
  });
}
