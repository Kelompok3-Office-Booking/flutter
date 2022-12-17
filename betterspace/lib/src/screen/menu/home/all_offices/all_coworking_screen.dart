import 'package:betterspace/src/model/office_models/office_dummy_models.dart';
import 'package:betterspace/src/screen/error/no_connection_screen.dart';
import 'package:betterspace/src/screen/landing/network_aware.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/view_model/get_location_view_model.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/view_model/office_viewmodels.dart';
import 'package:betterspace/src/widget/office_card_widget/horizontal_card_home.dart';
import 'package:betterspace/src/widget/widget/default_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllCoworkingScreen extends StatelessWidget {
  const AllCoworkingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationProvider =
        Provider.of<GetLocationViewModel>(context, listen: false);

    final officeListAlloffice =
        Provider.of<OfficeViewModels>(context, listen: true);

    List<OfficeModels> listOfAllCoworking =
        officeListAlloffice.listOfCoworkingSpace;

    return Scaffold(
      appBar: defaultAppbarWidget(
        contexts: context,
        titles: 'Popular Coworking',
        leadIconFunction: () {
          context.read<NavigasiViewModel>().navigasiPop(context);
        },
        isCenterTitle: false,
      ),
      body: NetworkAware(
        offlineChild: const NoConnectionScreen(),
        onlineChild: Padding(
          padding: EdgeInsets.only(
            left: AdaptSize.screenWidth * .016,
            right: AdaptSize.screenWidth * .016,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: listOfAllCoworking.length,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return horizontalCardHome(
                context: context,
                onTap: () {
                  context.read<NavigasiViewModel>().navigasiToDetailSpace(
                        context: context,
                        officeId: listOfAllCoworking[index].officeID,
                      );
                },
                officeImage: listOfAllCoworking[index].officeLeadImage,
                officeName: listOfAllCoworking[index].officeName,
                officeLocation:
                    '${listOfAllCoworking[index].officeLocation.district}, ${listOfAllCoworking[index].officeLocation.city}',
                officeStarRanting:
                    listOfAllCoworking[index].officeStarRating.toString(),
                officeApproxDistance: locationProvider.posisi != null
                    ? locationProvider.homeScreenCalculateDistances(
                        locationProvider.lat,
                        locationProvider.lng,
                        listOfAllCoworking[index].officeLocation.officeLatitude,
                        listOfAllCoworking[index]
                            .officeLocation
                            .officeLongitude,
                      )!
                    : '-',
                officePersonCapacity:
                    listOfAllCoworking[index].officePersonCapacity.toString(),
                officeArea: listOfAllCoworking[index].officeArea.toString(),
                hours: listOfAllCoworking[index].officeOpenTime.timeZoneName,
                officePricing:
                    listOfAllCoworking[index].officePricing.officePrice,
              );
            },
          ),
        ),
      ),
    );
  }
}
