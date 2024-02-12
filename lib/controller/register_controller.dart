import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:running_tracker/models/profile.dart';

class RegisterController extends GetxController {
  final Rx<DateTime> selectDate = DateTime.now().obs;
  final nameTexteditController = TextEditingController();
  RxInt selectedRadio = 0.obs;
  var profile = Profile(
    email: '',
    password: '',
    name: '',
    surname: '',
    birthday: '',
    gender: '',
    weight: '',
    height: '',
  ).obs;

  final formKey = GlobalKey<FormState>();
  changeDate(DateTime date) {
    selectDate.value != date;
    update();
  }

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: profile.value.email,
          password: profile.value.password,
        );
        // Handle successful registration
      } on FirebaseAuthException catch (e) {
        // Handle errors
        print(e);
      }
    }
  }

  void setSelectedGender(int value) {
    selectedRadio.value = value;
    if (selectedRadio.value == 0) {
      profile.value.gender = "man";
    } else {
      profile.value.gender = "woman";
    }
  }
}
  // Other methods and logic

