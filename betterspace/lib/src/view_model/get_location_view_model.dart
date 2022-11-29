import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GetLocationViewModel with ChangeNotifier {
  Position? _posisi;

  get posLongitude => _posisi!.longitude.toDouble();

  get posLatitude => _posisi!.latitude.toDouble();

  String? _address;

  get address => _address;

  /// permission lokasi chekker
  Future<Position> checkAndGetPosition() async {
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
    return _posisi = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  /// detail lokasi
  Future<void> getAddressFromLongLat(double posLat, double posLong) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(posLat, posLong);
    Placemark place = placemarks[0];
    _address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    notifyListeners();
  }
}
