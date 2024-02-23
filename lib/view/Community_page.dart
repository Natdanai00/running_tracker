import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:running_tracker/view/NavigatorBottom_page3.dart';
import 'package:running_tracker/view/Post_page.dart';

class ComunityPage extends StatelessWidget {
  const ComunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Post(username: 'Thanapon', content: 'สวัสดีครับ', tag: ''),
          Post(
              username: 'Thanapat',
              content: '17.00 น วิ่งที่สนามกีฬา RMUTT',
              tag: ''),
          Post(username: 'Natdanai', content: 'ในนี้มืดจังเลยนะฮ่ะ', tag: ''),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => createPostPage()),
          );
        },
        label: Text('Post'),
        icon: Icon(Icons.add),
      ),
    );
  }
}

class Post extends StatelessWidget {
  final String username;
  final String content;
  final String tag;

  Post({required this.username, required this.content, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.account_circle, size: 50),
            title: Text(username),
            subtitle: Text(content),
          ),
          Wrap(
            children: <Widget>[
              TextButton.icon(
                icon: Icon(Icons.comment),
                label: Text('Comment'),
                onPressed: () {},
              ),
              TextButton.icon(
                icon: Icon(Icons.favorite_border),
                label: Text('Like'),
                onPressed: () {},
              ),
            ],
          ),
          if (tag.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Chip(
                  label: Text(tag),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
