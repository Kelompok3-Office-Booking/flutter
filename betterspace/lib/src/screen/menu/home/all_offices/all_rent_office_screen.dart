import 'package:betterspace/src/model/office_models/office_dummy_models.dart';
import 'package:betterspace/src/screen/error/no_connection_screen.dart';
import 'package:betterspace/src/screen/landing/network_aware.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/remove_trailing_zero.dart';
import 'package:betterspace/src/view_model/get_location_view_model.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/view_model/office_viewmodels.dart';
import 'package:betterspace/src/widget/office_card_widget/horizontal_card_home.dart';
import 'package:betterspace/src/widget/widget/default_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllRentOfficeScreen extends StatelessWidget {
  const AllRentOfficeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationProvider =
        Provider.of<GetLocationViewModel>(context, listen: false);

    final officeListAlloffice =
        Provider.of<OfficeViewModels>(context, listen: true);

    List<OfficeModels> listOfAllOfficeRoom =
        officeListAlloffice.listOfOfficeRoom;

    return Scaffold(
      appBar: defaultAppbarWidget(
        contexts: context,
        titles: 'Office for Rent',
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
            itemCount: listOfAllOfficeRoom.length,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return horizontalCardHome(
                context: context,
                onTap: () {
                  context.read<NavigasiViewModel>().navigasiToDetailSpace(
                        context: context,
                        officeId: listOfAllOfficeRoom[index].officeID,
                      );
                },
                officeImage: listOfAllOfficeRoom[index].officeLeadImage,
                officeName: listOfAllOfficeRoom[index].officeName,
                officeLocation:
                    '${listOfAllOfficeRoom[index].officeLocation.district}, ${listOfAllOfficeRoom[index].officeLocation.city}',
                officeStarRanting:
                    listOfAllOfficeRoom[index].officeStarRating.toString(),
                officeApproxDistance: locationProvider.posisi != null
                    ? locationProvider.homeScreenCalculateDistances(
                        locationProvider.lat,
                        locationProvider.lng,
                        listOfAllOfficeRoom[index]
                            .officeLocation
                            .officeLatitude,
                        listOfAllOfficeRoom[index]
                            .officeLocation
                            .officeLongitude,
                      )!
                    : '-',
                officePersonCapacity:
                    listOfAllOfficeRoom[index].officePersonCapacity.toString().replaceAll(RemoveTrailingZero.regex, ''),
                officeArea: listOfAllOfficeRoom[index].officeArea.toString().replaceAll(RemoveTrailingZero.regex, ''),
                hours: '/Month',
                officePricing:
                    listOfAllOfficeRoom[index].officePricing.officePrice,
              );
            },
          ),
        ),
      ),
    );
  }
}
