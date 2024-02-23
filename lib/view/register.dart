import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import 'package:running_tracker/controller/register_controller.dart';
import 'package:sizer/sizer.dart';
import 'Login_page2.dart';

class RegisterScreen extends StatelessWidget {
  final controller = Get.put(RegisterController());

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Email", style: TextStyle(fontSize: 20)),
                Center(
                  child: Container(
                      height: 6.h,
                      width: 100.w,
                      decoration: BoxDecoration(border: Border.all(width: 2)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 2.w),
                        child: TextFormField(
                            controller: controller.emailcontroller,
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: "กรุณาป้อนอีเมลด้วยครับ"),
                              EmailValidator(errorText: "รูปแบบอีเมลไม่ถูกต้อง")
                            ]),
                            keyboardType: TextInputType.emailAddress,
                            scrollPadding: const EdgeInsets.all(1),
                            decoration:
                                const InputDecoration(hintText: "Email")),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Password", style: TextStyle(fontSize: 20)),
                Center(
                    child: Container(
                        height: 6.h,
                        width: 100.w,
                        decoration: BoxDecoration(border: Border.all(width: 2)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 2.w),
                          child: TextFormField(
                              controller: controller.password,
                              validator: RequiredValidator(
                                  errorText: "กรุณาป้อนรหัสผ่านด้วยครับ"),
                              obscureText: true,
                              scrollPadding: const EdgeInsets.all(1),
                              decoration: const InputDecoration(
                                hintText: "Password",
                              )),
                        ))),
                const SizedBox(
                  height: 15,
                ),
                const Text("Name", style: TextStyle(fontSize: 20)),
                Center(
                  child: Container(
                      height: 6.h,
                      width: 100.w,
                      decoration: BoxDecoration(border: Border.all(width: 2)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 2.w),
                        child: TextFormField(
                            controller: controller.nameTexteditController,
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: "กรุณาป้อนชื่อด้วยครับ"),
                            ]),
                            keyboardType: TextInputType.name,
                            scrollPadding: const EdgeInsets.all(1),
                            decoration:
                                const InputDecoration(hintText: "Name")),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Surname", style: TextStyle(fontSize: 20)),
                Center(
                    child: Container(
                        height: 6.h,
                        width: 100.w,
                        decoration: BoxDecoration(border: Border.all(width: 2)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 2.w),
                          child: TextFormField(
                              controller: controller.surnameTexteditController,
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: "กรุณาป้อนนามสกุลด้วยครับ"),
                              ]),
                              scrollPadding: const EdgeInsets.all(1),
                              decoration:
                                  const InputDecoration(hintText: "Surname")),
                        ))),
                const SizedBox(
                  height: 15,
                ),
                const Text("วันเดือนปีเกิด", style: TextStyle(fontSize: 20)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: OutlinedButton(
                        onPressed: () => controller.changeDate(context),
                        child: Obx(
                          () => Text(
                            DateFormat.yMd()
                                .format(controller.selectDate.value),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("เพศ", style: TextStyle(fontSize: 20)),
                Obx(() => selectGender()),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      child: const Text("ลงทะเบียน",
                          style: TextStyle(fontSize: 20)),
                      onPressed: () => controller.register()),
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
