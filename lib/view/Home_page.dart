import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:running_tracker/view/NavigatorBottom_page3.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 12),
            FloatingActionButton.extended(
              icon: const Icon(Icons.add),
              label: Text('Back'),
              onPressed: () => Get.back(),
            ),
          ],
        ),
      ),
    );
  }
}
