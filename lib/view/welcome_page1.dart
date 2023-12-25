import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:running_tracker/view/Login_page2.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Icon(
              FontAwesomeIcons.personRunning,
              size: 100,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Running Tracker',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Container(
              height: 50,
              width: 250,
              child: ElevatedButton(
                  onPressed: () => Get.to(() => LoginPage()),
                  child: Text('Welcome'),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.amber)))
        ],
      )),
    );
  }
}
