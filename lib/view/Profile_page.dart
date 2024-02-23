import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Tanapat Waenthongkham',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text('tanapat@gmail.com'),
            TextButton(
              child: const Text('Edit', style: TextStyle(color: Colors.blue)),
              onPressed: () {},
            ),
            const Divider(),
            const Text('This week', style: TextStyle(fontSize: 20)),

            const Divider(),
            const Text('Total Distance', style: TextStyle(fontSize: 20)),
            const Text('35.2 Kilometer'),
            const Divider(),
            const Text('Total Time', style: TextStyle(fontSize: 20)),
            const Text('02:36:02'),
            const Divider(),
            const Text('Activities', style: TextStyle(fontSize: 20)),
            const Text('Distance'),
            const Text('8.8 Km'),
            const Text('Time'),
            const Text('03:06:02'),
            const Divider(),
            const Text('Time in Heart Rate Zones',
                style: TextStyle(fontSize: 20)),
            // TODO: Add your heart rate zones here
          ],
        ),
      ),
    );
  }
}
