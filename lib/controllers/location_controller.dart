import 'dart:async';

import 'package:food_delivery_green/services/location_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  LocationController({
    required this.locationService,
  });
  LocationService locationService;
  double userLat = 0;
  double userLng = 0;
  Marker? userMarker;
  String? userLocation;
  CameraPosition? initialCameraPosition;
  String yourLocation='';

  Future<void> getUserLocation() async {
    Position userPosition = await locationService.getUserLocation();
    userLat = userPosition.latitude;
    userLng = userPosition.longitude;
    var placeId = await locationService.getPlaceId(userLat, userLng);
    var userPlaceDetails = await locationService.getUserPlaceDetails(placeId);
    userLocation = userPlaceDetails['formatted_address'];
    final marker = Marker(
      markerId: MarkerId(
        'user location $userLat&$userLng',
      ),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(userLat, userLng),
    );
    initialCameraPosition = CameraPosition(
      target: LatLng(userLat, userLng),
      zoom: 17.5,
    );
    userMarker = marker;
    update();
  }

  Future<void> getDraggedAddress(LatLng position) async {
    var result = await locationService.getDraggedLocationDetails(position);

    userLocation = result['formatted_address'];

    update();
  }

  Future<void> returnToUserCurrentLocation(
      Completer<GoogleMapController> googleCompleter) async {
    GoogleMapController mapController = await googleCompleter.future;
    Position userPosition = await locationService.getUserLocation();
    userLat = userPosition.latitude;
    userLng = userPosition.longitude;
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(userLat, userLng), zoom: 17.5),
      ),
    );
    initialCameraPosition =
        CameraPosition(target: LatLng(userLat, userLng), zoom: 17.5);
    update();
  }
  void getUserLocationName(){
    yourLocation=userLocation!;
    update();
  }
}
