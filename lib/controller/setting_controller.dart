import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:running_tracker/view/Login_page2.dart';

class SettingController extends GetxController {
  final auth = FirebaseAuth.instance.currentUser;
  sinout() async {
    if (auth!.uid.isNotEmpty) {
      await FirebaseAuth.instance.signOut();
      Get.to(() => const LoginPage());
    }
  }
}
