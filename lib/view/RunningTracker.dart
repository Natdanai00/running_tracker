import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:running_tracker/controller/RunningTracker.dart'; // Make sure to import your controller

class TrackingScreen extends StatelessWidget {
  final TrackingController trackingController = Get.put(TrackingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Run Tracker')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Time', style: TextStyle(fontSize: 25)),
            Obx(() => Text(
                  trackingController.currentTime.value,
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                )),
            // Add other widgets and observables here
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: trackingController.startOrStop,
        child: Obx(() => Icon(
              trackingController.isRunning.value
                  ? Icons.pause
                  : Icons.play_arrow,
            )),
      ),
    );
  }
}
