import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:running_tracker/models/profile.dart';
import 'package:running_tracker/view/Login_page2.dart';

class RegisterController extends GetxController {
  Rx<DateTime> selectDate = DateTime.now().obs;
  String formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  final nameTexteditController = TextEditingController();
  RxInt selectedRadio = 0.obs;
  RxList<Profile> profileData = <Profile>[].obs;
  final emailcontroller = TextEditingController();
  final password = TextEditingController();
  RxString gander = 'man'.obs;
  final surnameTexteditController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text,
          password: password.text,
        );
        if (nameTexteditController.text.isNotEmpty &&
            surnameTexteditController.text.isNotEmpty &&
            emailcontroller.text.isNotEmpty &&
            password.text.isNotEmpty) {
          await firestore
              .collection("UserData")
              .doc(auth.currentUser!.uid)
              .set({
            "email": emailcontroller.text,
            "password": password.text,
            "name": nameTexteditController.text,
            "surname": surnameTexteditController.text,
            "birthday": selectDate.value,
            "gender": gander.value,
          });
          nameTexteditController.clear();
          surnameTexteditController.clear();
          emailcontroller.clear();
          password.clear();
          selectDate.value = DateTime.now();
          Get.to(() => LoginPage());
        }
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

  void setSelectedGender(int value) {
    selectedRadio.value = value;
    if (selectedRadio.value == 0) {
      gander.value = "man";
    } else {
      gander.value = "woman";
    }
  }

  changeDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectDate.value,
      firstDate: DateTime(1950),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectDate.value) {
      selectDate.value = picked;
      update();
    }
  }

  Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: selectDate.value,
          firstDate: DateTime(1950),
          lastDate: DateTime(2101),
        );
      },
    );
  }
}
