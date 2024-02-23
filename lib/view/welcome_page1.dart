import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:running_tracker/color.dart';
import 'package:running_tracker/view/Login_page2.dart';
import 'package:running_tracker/view/register.dart';
import 'package:sizer/sizer.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.themecolor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: const Center(
                      child: Icon(FontAwesomeIcons.personRunning,
                          size: 100, color: Colors.black)))),
          SizedBox(height: 2.h),
          const Text("Welcome to ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          const Text("Running Application",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all<Size>(Size(30.w, 5.5.h)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    side: MaterialStateProperty.all<BorderSide>(
                        BorderSide(color: Colors.black, width: 0.5.w)),
                    elevation: MaterialStateProperty.all<double>(0),
                  ),
                  onPressed: () => Get.to(() => const LoginPage()),
                  child: const Text("Login", style: TextStyle(fontSize: 20))),
              SizedBox(width: 5.w),
              ElevatedButton(
                  style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all<Size>(Size(30.w, 5.5.h)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    side: MaterialStateProperty.all<BorderSide>(
                        const BorderSide(color: Colors.black)),
                    elevation: MaterialStateProperty.all<double>(0),
                  ),
                  onPressed: () => Get.to(() => RegisterScreen()),
                  child:
                      const Text("Register", style: TextStyle(fontSize: 20))),
            ],
          ),
        ],
      ),
    );
  }
}
