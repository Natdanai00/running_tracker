import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:running_tracker/controller/DatePickerController.dart';
import 'package:running_tracker/controller/register_controller.dart';
import 'package:running_tracker/models/gender.dart';
import 'Login_page2.dart';
import 'package:running_tracker/models/profile.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class RegisterScreen extends StatelessWidget {
  final controller = Get.put(RegisterController());
  final DatePickerController datePickerController =
      Get.put(DatePickerController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("สร้างบัญชีผู้ใช้")),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("อีเมล", style: TextStyle(fontSize: 20)),
                TextFormField(
                  validator: MultiValidator([
                    RequiredValidator(errorText: "กรุณาป้อนอีเมลด้วยครับ"),
                    EmailValidator(errorText: "รูปแบบอีเมลไม่ถูกต้อง")
                  ]),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (email) {
                    controller.profile.value.email = email ?? '';
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Text("รหัสผ่าน", style: TextStyle(fontSize: 20)),
                TextFormField(
                  validator:
                      RequiredValidator(errorText: "กรุณาป้อนรหัสผ่านด้วยครับ"),
                  obscureText: true,
                  onSaved: (password) {
                    controller.profile.value.password = password ?? '';
                  },
                ),
                Text("ชื่อ", style: TextStyle(fontSize: 20)),
                TextFormField(
                  validator: MultiValidator([
                    RequiredValidator(errorText: "กรุณาป้อนชื่อด้วยครับ"),
                  ]),
                  keyboardType: TextInputType.name,
                  onSaved: (name) {
                    controller.profile.value.name = name!;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Text("นามสกุล", style: TextStyle(fontSize: 20)),
                TextFormField(
                  validator: MultiValidator([
                    RequiredValidator(errorText: "กรุณาป้อนนามสกุลด้วยครับ"),
                  ]),
                  onSaved: (surname) {
                    controller.profile.value.surname = surname!;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Text("วันเดือนปีเกิด", style: TextStyle(fontSize: 20)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: OutlinedButton(
                        onPressed: () =>
                            datePickerController.selectDate(context),
                        child: Text("${datePickerController.formattedDate}"),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text("เพศ", style: TextStyle(fontSize: 20)),
                Obx(() => selectGender()),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child:
                        const Text("ลงทะเบียน", style: TextStyle(fontSize: 20)),
                    onPressed: () async {
                      if (controller.nameTexteditController.text.isNotEmpty) {
                        formKey.currentState?.save();
                        try {
                          var profile;
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: profile.email,
                                  password: profile.password)
                              .then((value) {
                            formKey.currentState?.reset();
                            Fluttertoast.showToast(
                                msg: "สร้างบัญชีผู้ใช้เรียบร้อยแล้ว",
                                gravity: ToastGravity.TOP);
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return LoginPage();
                            }));
                          });
                        } on FirebaseAuthException catch (e) {
                          print(e.code);
                          String message;
                          if (e.code == 'email-already-in-use') {
                            message =
                                "มีอีเมลนี้ในระบบแล้วครับ โปรดใช้อีเมลอื่นแทน";
                          } else if (e.code == 'weak-password') {
                            message = "รหัสผ่านต้องมีความยาว 6 ตัวอักษรขึ้นไป";
                          } else {
                            message = e.message!;
                          }
                          Fluttertoast.showToast(
                              msg: message, gravity: ToastGravity.CENTER);
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget selectGender() {
    return Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Radio(
          activeColor: Colors.orange,
          value: 0,
          groupValue: controller.selectedRadio.value,
          onChanged: (value) => controller.setSelectedGender(value!)),
      const Text('ชาย',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
      Radio(
          activeColor: Colors.orange,
          value: 1,
          groupValue: controller.selectedRadio.value,
          onChanged: (value) => controller.setSelectedGender(value!)),
      const Text('หญิง',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black))
    ]));
  }

  // UI for form fields and buttons
}
