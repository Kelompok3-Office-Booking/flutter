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

class AllRecomendationOfficeScreen extends StatelessWidget {
  const AllRecomendationOfficeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationProvider =
        Provider.of<GetLocationViewModel>(context, listen: false);
    final officeListrecommendation =
        Provider.of<OfficeViewModels>(context, listen: false);
    officeListrecommendation.fetchOfficeByRecommendation();

    final officeListAlloffice =
        Provider.of<OfficeViewModels>(context, listen: true);

    List<OfficeModels> listOfRecomendationRoom =
        officeListAlloffice.listOfOfficeByRecommendation;

    return Scaffold(
      appBar: defaultAppbarWidget(
        contexts: context,
        titles: 'Recommendation',
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
            itemCount: listOfRecomendationRoom.length,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return horizontalCardHome(
                context: context,
                onTap: () {
                  context.read<NavigasiViewModel>().navigasiToDetailSpace(
                        context: context,
                        officeId: listOfRecomendationRoom[index].officeID,
                      );
                },
                officeImage: listOfRecomendationRoom[index].officeLeadImage,
                officeName: listOfRecomendationRoom[index].officeName,
                officeLocation:
                    '${listOfRecomendationRoom[index].officeLocation.district}, ${listOfRecomendationRoom[index].officeLocation.city}',
                officeStarRanting:
                    listOfRecomendationRoom[index].officeStarRating.toString(),
                officeApproxDistance: locationProvider.posisi != null
                    ? locationProvider.homeScreenCalculateDistances(
                        locationProvider.lat,
                        locationProvider.lng,
                        listOfRecomendationRoom[index]
                            .officeLocation
                            .officeLatitude,
                        listOfRecomendationRoom[index]
                            .officeLocation
                            .officeLongitude,
                      )!
                    : '-',
                officePersonCapacity: listOfRecomendationRoom[index]
                    .officePersonCapacity
                    .toString().replaceAll(RemoveTrailingZero.regex, ''),
                officeArea:
                    listOfRecomendationRoom[index].officeArea.toString().replaceAll(RemoveTrailingZero.regex, ''),
                hours: listOfRecomendationRoom[index].officeType == "Office" ? '/Month' : '/Hours',
                officePricing:
                    listOfRecomendationRoom[index].officePricing.officePrice,
              );
            },
          ),
        ),
      ),
    );
  }
}
