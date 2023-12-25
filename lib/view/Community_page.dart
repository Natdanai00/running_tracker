import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Center(child: Text("community"))
        ],
      )),
    );
  }
}
