import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class LocationService extends GetxService {
  String key = 'API-KEY';
  Future<String> getPlaceId(double lat, double lng) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&radius=200&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);

    var placeId = json['results'][0]['place_id'];

    return placeId;
  }

  Future<Map<String, dynamic>> getUserPlaceDetails(String placeId) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    var result = json['result'] as Map<String, dynamic>;
    return result;
  }

  Future<Position> getUserLocation() async {
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
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    var userLocation = await Geolocator.getCurrentPosition();

    return userLocation;
  }

  Future<Map<String, dynamic>> getDraggedLocationDetails(
      LatLng position) async {
    var placeId = await getPlaceId(position.latitude, position.longitude);

    var result = await getUserPlaceDetails(placeId);
    return result;
  }
}
