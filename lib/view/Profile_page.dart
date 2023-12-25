import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:running_tracker/view/Home_page.dart';
import 'package:running_tracker/view/NavigatorBottom_page3.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            new Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xFF26CBE6),
                Color(0xFF26CBC0),
              ], begin: Alignment.topCenter, end: Alignment.center)),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                child: Stack(
                  children: <Widget>[
                    const Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Natdanai',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.2),
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 2.6, left: 20, right: 20),
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black45,
                                      blurRadius: 2.0,
                                      offset: Offset(0.0, 2.0))
                                ]),
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    headerChild('Photos', 114),
                                    headerChild('Followers', 1205),
                                    headerChild('Following', 360),
                                  ]),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Column(
                              children: <Widget>[
                                Icon(FontAwesomeIcons.person),
                                Text('Natdanai Wongpanya'),
                                Icon(FontAwesomeIcons.envelope),
                                Text('1163104620112@mail.rmutt.ac.th'),
                                Icon(FontAwesomeIcons.phone),
                                Text('0619965151'),
                                Icon(FontAwesomeIcons.envelope),
                                Text('zulfiqar108@gmail.com'),
                                Padding(
                                  padding: EdgeInsets.only(top: 30),
                                  child: Container(
                                    width: 3,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                        color: Color(0xFF26CBE6),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(40)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black87,
                                              blurRadius: 2.0,
                                              offset: Offset(0.0, 1.0))
                                        ]),
                                    child: const Center(
                                      child: Text('FOLLOW ME',
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget headerChild(String header, int value) => new Expanded(
          child: new Column(
        children: <Widget>[
          new Text(header),
          new SizedBox(
            height: 8.0,
          ),
          new Text(
            '$value',
            style: new TextStyle(
                fontSize: 14.0,
                color: const Color(0xFF26CBE6),
                fontWeight: FontWeight.bold),
          )
        ],
      ));

  Widget infoChild(double width, IconData icon, data) => new Padding(
        padding: new EdgeInsets.only(bottom: 8.0),
        child: new InkWell(
          child: new Row(
            children: <Widget>[
              new SizedBox(
                width: width / 10,
              ),
              new Icon(
                icon,
                color: const Color(0xFF26CBE6),
                size: 36.0,
              ),
              new SizedBox(
                width: width / 20,
              ),
              new Text(data)
            ],
          ),
          onTap: () {
            print('Info Object selected');
          },
        ),
      );
}
