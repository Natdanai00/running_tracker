import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:running_tracker/color.dart';
import 'package:running_tracker/controller/logincontrooler.dart';
import 'package:running_tracker/models/profile.dart';
import 'package:running_tracker/view/Home_page.dart';
import 'package:running_tracker/view/NavigatorBottom_page3.dart';
import 'package:running_tracker/view/register.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: const Center(
                  child: Icon(FontAwesomeIcons.personRunning,
                      size: 100, color: Colors.black))),
          const Text("Login",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36)),
          SizedBox(height: 5.h),
          Center(
            child: Container(
                height: 6.h,
                width: 85.w,
                decoration: BoxDecoration(border: Border.all(width: 2)),
                child: TextFormField(
                    controller: controller.emailcontroller,
                    scrollPadding: const EdgeInsets.all(1),
                    decoration: const InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(FontAwesomeIcons.user)))),
          ),
          SizedBox(height: 2.h),
          Center(
              child: Container(
                  height: 6.h,
                  width: 85.w,
                  decoration: BoxDecoration(border: Border.all(width: 2)),
                  child: TextFormField(
                      controller: controller.passwordcontroller,
                      scrollPadding: const EdgeInsets.all(1),
                      decoration: const InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(FontAwesomeIcons.key))))),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "forgot password?",
                    style: TextStyle(color: ColorApp.themecolor),
                  )),
              SizedBox(width: 4.5.w),
            ],
          ),
          Column(
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                    minimumSize:
                        MaterialStateProperty.all<Size>(Size(85.w, 6.h)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    elevation: MaterialStateProperty.all<double>(0),
                  ),
                  onPressed: () => controller.login(),
                  child: const Text("Login")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              TextButton(
                  onPressed: () => Get.to(() => RegisterScreen()),
                  child: Text(
                    "sign up",
                    style: TextStyle(color: ColorApp.themecolor),
                  ))
            ],
          )
        ],
      )),
    );
  }
}
