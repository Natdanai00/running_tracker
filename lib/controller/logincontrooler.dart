import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:running_tracker/models/profile.dart';
import 'package:running_tracker/view/NavigatorBottom_page3.dart';

class LoginController extends GetxController {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  RxList<Profile> userdata = <Profile>[].obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  login() async {
    if (emailcontroller.text.isNotEmpty && passwordcontroller.text.isNotEmpty) {
      try {
        await auth
            .signInWithEmailAndPassword(
                email: emailcontroller.text, password: passwordcontroller.text)
            .then((value) async {
          DocumentSnapshot userExists = await firestore
              .collection("UserData")
              .doc(auth.currentUser!.uid)
              .get();
          if (userExists.exists) {
            Map<String, dynamic> data =
                userExists.data() as Map<String, dynamic>;
            userdata.add(Profile(
                email: data["email"],
                password: data["password"],
                name: data["name"],
                surname: data["surname"],
                birthday:
                    DateFormat('dd/MM/yyyy').format(data["birthday"].toDate()),
                gender: data["gender"],
                phonenum: "",
                address: "",
                weight: "",
                height: ""));
          }
          ;
          Get.to(() => LandingPage());
        });
      } on FirebaseAuthException catch (e) {
        debugPrint(e.code);
        String message;
        if (e.code == 'email-already-in-use') {
          message = "มีอีเมลนี้ในระบบแล้วครับ โปรดใช้อีเมลอื่นแทน";
        } else if (e.code == 'weak-password') {
          message = "รหัสผ่านต้องมีความยาว 6 ตัวอักษรขึ้นไป";
        } else {
          message = e.message!;
        }
        Fluttertoast.showToast(msg: message, gravity: ToastGravity.CENTER);
      }
    }
  }
}
