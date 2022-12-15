import 'dart:async';
import 'package:betterspace/src/model/office_models/office_dummy_models.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/get_location_view_model.dart';
import 'package:betterspace/src/widget/widget/bottom_animation_maps.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class GoogleMapsWidget extends StatefulWidget {
  final OfficeModels officeData;

  const GoogleMapsWidget({super.key, required this.officeData});

  @override
  State<GoogleMapsWidget> createState() => _GoogleMapsWidgetState();
}

class _GoogleMapsWidgetState extends State<GoogleMapsWidget> {
  final Completer<GoogleMapController> controllerMaps = Completer();

  @override
  void initState() {
    super.initState();
    final mapsProviders =
        Provider.of<GetLocationViewModel>(context, listen: false);
    Future.delayed(Duration.zero, () {
      /// polylines
      mapsProviders.createPolylines(
        destinationCoordinates: LatLng(
          widget.officeData.officeLocation.officeLatitude,
          widget.officeData.officeLocation.officeLongitude,
        ),
      );

      /// marker
      mapsProviders.addMarker(
        /// latlng testing
        destinationLat: widget.officeData.officeLocation.officeLatitude,
        destinationLng: widget.officeData.officeLocation.officeLongitude,
        id: widget.officeData.officeID,
        descriptor:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: AdaptSize.paddingTop),
        child: Consumer<GetLocationViewModel>(builder: (context, value, child) {
          return Stack(
            children: [
              GoogleMap(
                initialCameraPosition: const CameraPosition(

                    /// target destination
                    target: LatLng(-6.990638, 110.423667),
                    zoom: 15),
                myLocationEnabled: true,
                tiltGesturesEnabled: true,
                compassEnabled: true,
                indoorViewEnabled: true,
                scrollGesturesEnabled: true,
                zoomGesturesEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  value.controllerMaps.complete(controller);
                },
                zoomControlsEnabled: false,
                markers: Set<Marker>.of(value.markers.values),
                polylines: Set<Polyline>.of(value.polylines.values),
              ),

              /// bottom information
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    bottomAnimationMaps(
                        context: context,
                        userAddress: value.address,
                        officeAddress:
                            '${widget.officeData.officeLocation.city}, ${widget.officeData.officeLocation.district}',
                        distance: value.calculateDistances(value.lat,value.lng,
                            widget.officeData.officeLocation.officeLatitude,
                            widget.officeData.officeLocation.officeLongitude),
                        onPressed: () {
                          value.launchGMap(
                              posLat: widget
                                  .officeData.officeLocation.officeLatitude,
                              posLng: widget
                                  .officeData.officeLocation.officeLongitude);
                        }),
                    Text(
                      'show detail',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: MyColor.secondary400,
                          fontSize: AdaptSize.screenHeight * .014),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
