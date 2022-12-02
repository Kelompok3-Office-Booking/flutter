import 'package:betterspace/src/dummy_data/office_dummy_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OfficeDataViewModels with ChangeNotifier {
  List<OfficeModels> _listOfOfficeModels = [];
  List<OfficeModels> get listOfOfficeModels => _listOfOfficeModels;

  addRecord(OfficeModels officeDatas) {
    _listOfOfficeModels.add(officeDatas);
  }
}

class OfficeDataDummy {
  List<OfficeModels> _listOfOfficeModels = [];
  final OfficePricing officePricings = OfficePricing(
      officePrice: 388888,
      officePriceUnits: "Persons",
      officePricingCurrency: "Rp");
  final List<OfficeCapacityModels> listOfCapacityModels = [
    OfficeCapacityModels(
        capacityIcon: Icon(Icons.add),
        capacityTitle: "Working Desk",
        capacityValue: 999,
        capacityUnits: "desk"),
    OfficeCapacityModels(
        capacityIcon: Icon(Icons.add),
        capacityTitle: "Working Desk",
        capacityValue: 999,
        capacityUnits: "desk"),
    OfficeCapacityModels(
        capacityIcon: Icon(Icons.add),
        capacityTitle: "Working Desk",
        capacityValue: 999,
        capacityUnits: "desk"),
    OfficeCapacityModels(
        capacityIcon: Icon(Icons.add),
        capacityTitle: "Working Desk",
        capacityValue: 999,
        capacityUnits: "desk"),
  ];
  final List<OfficeFacilitiesModels> listOfOfficeFacilitesModels = [
    OfficeFacilitiesModels(
        facilitiesIcon: Icon(Icons.add), facilitiesTitle: "High Speed Wifi"),
    OfficeFacilitiesModels(
        facilitiesIcon: Icon(Icons.add), facilitiesTitle: "High Speed Wifi"),
    OfficeFacilitiesModels(
        facilitiesIcon: Icon(Icons.add), facilitiesTitle: "High Speed Wifi"),
    OfficeFacilitiesModels(
        facilitiesIcon: Icon(Icons.add), facilitiesTitle: "High Speed Wifi"),
  ];
  final List<OfficeReviewModels> listOfReviewModels = [
    OfficeReviewModels(
        reviewerUserImage: const Image(
            image: AssetImage("assets/image_assets/space_image/space1.png")),
        reviewerUserName: "dummy name",
        reviewText: "dummy text",
        reviewDate: DateTime.now(),
        reviewStarsCount: 4,
        reviewHelpRateCount: 999),
    OfficeReviewModels(
        reviewerUserImage: const Image(
            image: AssetImage("assets/image_assets/space_image/space1.png")),
        reviewerUserName: "dummy name",
        reviewText: "dummy text",
        reviewDate: DateTime.now(),
        reviewStarsCount: 4,
        reviewHelpRateCount: 999),
    OfficeReviewModels(
        reviewerUserImage: const Image(
            image: AssetImage("assets/image_assets/space_image/space1.png")),
        reviewerUserName: "dummy name",
        reviewText: "dummy text",
        reviewDate: DateTime.now(),
        reviewStarsCount: 4,
        reviewHelpRateCount: 999),
    OfficeReviewModels(
        reviewerUserImage: const Image(
            image: AssetImage("assets/image_assets/space_image/space1.png")),
        reviewerUserName: "dummy name",
        reviewText: "dummy text",
        reviewDate: DateTime.now(),
        reviewStarsCount: 4,
        reviewHelpRateCount: 999),
  ];
  OfficeDataDummy() {
    _listOfOfficeModels = [
      OfficeModels(
          officeID: '1',
          officeName: "dummy office name",
          officeLeadImage: const Image(
              image: AssetImage("assets/image_assets/space_image/space1.png")),
          officeGridImage: [],
          officeQuickLocation: "dummy, Dummy Town",
          officeDescription: "lorem ipsum sit dolor amet",
          officeApproxDistance: 50,
          officeArea: 50,
          officePersonCapacity: 999,
          officeOpenTime: DateTime.now(),
          officeCloseTime: DateTime.now(),
          officeLatitude: 1.1111111111,
          officeLongitude: 1.211111111,
          officePricing: officePricings,
          listOfOfficeCapcityModels: listOfCapacityModels,
          listOfOfficeFacilitiesModels: listOfOfficeFacilitesModels,
          listOfOfficeReviewModels: listOfReviewModels),
      OfficeModels(
          officeID: '2',
          officeName: "dummy office name",
          officeLeadImage: const Image(
              image: AssetImage("assets/image_assets/space_image/space1.png")),
          officeGridImage: [],
          officeQuickLocation: "dummy, Dummy Town",
          officeDescription: "lorem ipsum sit dolor amet",
          officeApproxDistance: 50,
          officeArea: 50,
          officePersonCapacity: 999,
          officeOpenTime: DateTime.now(),
          officeCloseTime: DateTime.now(),
          officeLatitude: 1.1111111111,
          officeLongitude: 1.211111111,
          officePricing: officePricings,
          listOfOfficeCapcityModels: listOfCapacityModels,
          listOfOfficeFacilitiesModels: listOfOfficeFacilitesModels,
          listOfOfficeReviewModels: listOfReviewModels),
      OfficeModels(
          officeID: '3',
          officeName: "dummy office name",
          officeLeadImage: const Image(
              image: AssetImage("assets/image_assets/space_image/space1.png")),
          officeGridImage: [],
          officeQuickLocation: "dummy, Dummy Town",
          officeDescription: "lorem ipsum sit dolor amet",
          officeApproxDistance: 50,
          officeArea: 50,
          officePersonCapacity: 999,
          officeOpenTime: DateTime.now(),
          officeCloseTime: DateTime.now(),
          officeLatitude: 1.1111111111,
          officeLongitude: 1.211111111,
          officePricing: officePricings,
          listOfOfficeCapcityModels: listOfCapacityModels,
          listOfOfficeFacilitiesModels: listOfOfficeFacilitesModels,
          listOfOfficeReviewModels: listOfReviewModels),
      OfficeModels(
          officeID: '4',
          officeName: "dummy office name",
          officeLeadImage: const Image(
              image: AssetImage("assets/image_assets/space_image/space1.png")),
          officeGridImage: [],
          officeQuickLocation: "dummy, Dummy Town",
          officeDescription: "lorem ipsum sit dolor amet",
          officeApproxDistance: 50,
          officeArea: 50,
          officePersonCapacity: 999,
          officeOpenTime: DateTime.now(),
          officeCloseTime: DateTime.now(),
          officeLatitude: 1.1111111111,
          officeLongitude: 1.211111111,
          officePricing: officePricings,
          listOfOfficeCapcityModels: listOfCapacityModels,
          listOfOfficeFacilitiesModels: listOfOfficeFacilitesModels,
          listOfOfficeReviewModels: listOfReviewModels),
    ];
  }
}
