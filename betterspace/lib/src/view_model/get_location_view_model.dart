import 'dart:async';
import 'dart:math';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/widget/dialog/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class GetLocationViewModel with ChangeNotifier {
  String text1 = 'Allow ';
  String text2 = 'Better Space App ';
  String text3 =
      'requires permission to access your phone\'s location, used to Calculate the distance of the office from your current position';
  Position? _posisi;

  late double? lat;

  late double? lng;

  /// permission lokasi chekker
  Future checkAndGetPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    _posisi = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    if (_posisi != null) {
      lat = _posisi?.latitude;
      lng = _posisi?.longitude;
    }
  }

  /// permission lokasi chekker
  Future permissionLocationGMap(context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return CustomDialog.singleActionDialogWithoutImage(
          context: context,
          title: 'text permission',
          text1: text1,
          text2: text2,
          text3: text3,
          withTextRich: true,
          onPressed: () {
            Provider.of<NavigasiViewModel>(context, listen: false)
                .navigasiPop(context);
          });
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return CustomDialog.singleActionDialogWithoutImage(
            context: context,
            title: 'text permission',
            withTextRich: true,
            text1: text1,
            text2: text2,
            text3: text3,
            onPressed: () {
              Provider.of<NavigasiViewModel>(context, listen: false)
                  .navigasiPop(context);
            });
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return CustomDialog.singleActionDialogWithoutImage(
          context: context,
          withTextRich: true,
          text1: text1,
          text2: text2,
          text3: text3,
          title: 'text permission',
          onPressed: () {
            Provider.of<NavigasiViewModel>(context, listen: false)
                .navigasiPop(context);
          });
    }
    _posisi = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    if (_posisi != null) {
      lat = _posisi?.latitude;
      lng = _posisi?.longitude;
    }

    if (serviceEnabled) {
      Provider.of<NavigasiViewModel>(context, listen: false)
          .navigasiOpenGoogleMaps(context);
    }
  }

  /// calculate distance current user to office
  Future<String> calculateDistance(
    LatLng destinationLocation,
  ) async {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((destinationLocation.latitude - _posisi!.latitude) * p) / 2 +
        c(_posisi!.latitude * p) *
            c(destinationLocation.latitude * p) *
            (1 - c((destinationLocation.longitude - _posisi!.longitude) * p)) /
            2;
    var distance = 12742 * asin(sqrt(a));

    if (distance < 1) {
      return "${(double.parse(distance.toStringAsFixed(3)) * 1000).toString().split(".")[0]} m";
    } else {
      return "${double.parse(distance.toStringAsFixed(2))} km";
    }
  }
}
