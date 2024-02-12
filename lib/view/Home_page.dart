import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:running_tracker/controller/MapTracker.dart';
import 'package:running_tracker/view/RunningTracker.dart';

class HomePage extends StatelessWidget {
  final MapTrackerController controller = Get.put(MapTrackerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        var location = controller.currentLocation.value;
        if (location == null) {
          return Center(child: CircularProgressIndicator());
        }

        return Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(location.latitude!, location.longitude!),
                zoom: 15,
              ),
              markers: Set<Marker>.of(controller.markers),
              onMapCreated: (GoogleMapController googleMapController) {
                controller.googleMapController = googleMapController;
              },
            ),
            Positioned(
              bottom: 8.0,
              left: 8.0,
              right: 8.0,
              child: Column(
                children: [
                  FloatingActionButton.extended(
                    heroTag: "5K test",
                    onPressed: () {
                      // Handle 5K test action
                    },
                    label: Text('5K test'),
                    icon: Icon(Icons.directions_run),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TrackingScreen()),
                      );
                    },
                    icon: Icon(Icons.play_arrow),
                    label: Text('Start Run'),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
