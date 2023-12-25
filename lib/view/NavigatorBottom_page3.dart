// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:running_tracker/color.dart';
import 'package:running_tracker/controller/NavigationBottom_controller.dart';
import 'package:running_tracker/view/Community_page.dart';
import 'package:running_tracker/view/Home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:running_tracker/view/Profile_page.dart';
import 'package:running_tracker/view/notification_page.dart';
import 'package:running_tracker/view/setting_page.dart';

class LandingPage extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  LandingPage({super.key});

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 60,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: ColorApp.themecolor,
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Color.fromARGB(255, 255, 255, 255),
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 7),
                    child: Icon(
                      FontAwesomeIcons.house,
                      size: 20.0,
                    ),
                  ),
                  label: 'Home',
                  backgroundColor: ColorApp.themecolor),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 7),
                    child: Icon(
                      FontAwesomeIcons.circleUser,
                      size: 20.0,
                    ),
                  ),
                  label: 'Profile',
                  backgroundColor: ColorApp.themecolor2),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 7),
                    child: Icon(
                      FontAwesomeIcons.users,
                      size: 20.0,
                    ),
                  ),
                  label: 'Community',
                  backgroundColor: ColorApp.themecolor),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    FontAwesomeIcons.bell,
                    size: 20.0,
                  ),
                ),
                label: 'Notifications',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    FontAwesomeIcons.gear,
                    size: 20.0,
                  ),
                ),
                label: 'Settings',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final LandingPageController landingPageController =
        Get.put(LandingPageController(), permanent: false);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
      body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: [
              HomePage(),
              ProfilePage(),
              CommunityPage(),
              NotificationPage(),
              SettingPage(),
            ],
          )),
    ));
  }
}
