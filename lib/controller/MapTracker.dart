import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapTrackerController extends GetxController {
  var markers = <Marker>{}.obs;
  late GoogleMapController googleMapController;
  var currentLocation = Rx<LocationData?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchLocation();
  }

  void fetchLocation() async {
    Location location = Location();
    currentLocation.value = await location.getLocation();
    updateMarkers(currentLocation.value);
  }

  void updateMarkers(LocationData? location) {
    if (location != null) {
      markers.add(
        Marker(
          markerId: const MarkerId('current_location'),
          position: LatLng(location.latitude!, location.longitude!),
          infoWindow: const InfoWindow(title: 'Your Location'),
        ),
      );
    }
  }
}
