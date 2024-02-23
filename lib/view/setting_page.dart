import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:running_tracker/controller/setting_controller.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});
  final controller = Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          const Spacer(),
          ElevatedButton.icon(
              onPressed: () => controller.sinout(),
              icon: const Icon(FontAwesomeIcons.arrowRightFromBracket),
              label: const Text("Logout"))
        ],
      )),
    );
  }
}
