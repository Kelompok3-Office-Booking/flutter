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

class AllMeetingRoomScreen extends StatelessWidget {
  const AllMeetingRoomScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationProvider =
        Provider.of<GetLocationViewModel>(context, listen: false);
    final officeListOffice =
        Provider.of<OfficeViewModels>(context, listen: false);
    officeListOffice.fetchOfficeRoom();
    final officeListAlloffice =
        Provider.of<OfficeViewModels>(context, listen: true);

    List<OfficeModels> listOfAllMeetingRoom =
        officeListAlloffice.listOfMeetingRoom;

    return Scaffold(
      appBar: defaultAppbarWidget(
        contexts: context,
        titles: 'Meeting Rooms',
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
            itemCount: listOfAllMeetingRoom.length,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return horizontalCardHome(
                context: context,
                onTap: () {
                  context.read<NavigasiViewModel>().navigasiToDetailSpace(
                        context: context,
                        officeId: listOfAllMeetingRoom[index].officeID,
                      );
                },
                officeImage: listOfAllMeetingRoom[index].officeLeadImage,
                officeName: listOfAllMeetingRoom[index].officeName,
                officeLocation:
                    '${listOfAllMeetingRoom[index].officeLocation.district}, ${listOfAllMeetingRoom[index].officeLocation.city}',
                officeStarRanting:
                    listOfAllMeetingRoom[index].officeStarRating.toString(),
                officeApproxDistance: locationProvider.posisi != null
                    ? locationProvider.homeScreenCalculateDistances(
                        locationProvider.lat,
                        locationProvider.lng,
                        listOfAllMeetingRoom[index]
                            .officeLocation
                            .officeLatitude,
                        listOfAllMeetingRoom[index]
                            .officeLocation
                            .officeLongitude,
                      )!
                    : '-',
                officePersonCapacity:
                    listOfAllMeetingRoom[index].officePersonCapacity.toString(),
                officeArea: listOfAllMeetingRoom[index].officeArea.toString(),
                hours: 'Hours',
                officePricing:
                    listOfAllMeetingRoom[index].officePricing.officePrice,
              );
            },
          ),
        ),
      ),
    );
  }
}
