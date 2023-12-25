import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:running_tracker/models/profile.dart';
import 'package:running_tracker/view/Home_page.dart';
import 'package:running_tracker/view/NavigatorBottom_page3.dart';
import 'package:running_tracker/register.dart';

class LoginPage extends StatelessWidget {
  const LoginPage();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    Profile profile = Profile(email: '', password: '');

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: buildLoginForm(context, formKey, profile),
        ),
      ),
    );
  }

  Widget buildLoginForm(
      BuildContext context, GlobalKey<FormState> formKey, Profile profile) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'Login',
            style: TextStyle(fontSize: 50),
          ),
        ),
        Form(
          key: formKey,
          child: Column(
            children: [
              buildTextFormField(
                  'please enter your email', TextInputType.emailAddress,
                  (email) {
                profile.email = email!;
              }),
              buildTextFormField(
                  'please enter your password', TextInputType.text, (password) {
                profile.password = password!;
              }, obscureText: true),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6CE5E8),
          ),
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              try {
                await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                  email: profile.email,
                  password: profile.password,
                )
                    .then((value) {
                  formKey.currentState!.reset();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return LandingPage();
                  }));
                });
              } on FirebaseAuthException catch (e) {
                Fluttertoast.showToast(
                  msg: e.message!,
                  gravity: ToastGravity.CENTER,
                );
              }
            }
          },
          child: const Text(
            'login',
            style: TextStyle(color: Colors.white),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6CE5E8),
          ),
          onPressed: () => Get.to(() => RegisterScreen()),
          child: const Text(
            'Register',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget buildTextFormField(String hintText, TextInputType keyboardType,
      void Function(String?) onSaved,
      {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Color(0xFF6CE5E8)),
            borderRadius: BorderRadius.circular(50.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Color(0xFF6CE5E8)),
            borderRadius: BorderRadius.circular(50.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Color(0xFF6CE5E8)),
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        keyboardType: keyboardType,
        onSaved: onSaved,
        obscureText: obscureText,
      ),
    );
  }
}
