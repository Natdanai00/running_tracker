import 'package:flutter/material.dart';

class createPostPage extends StatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<createPostPage> {
  final _formKey = GlobalKey<FormState>();
  String _content = '';

  void _submitPost() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // TODO: Save the post to Firebase
      print('Post: $_content');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _submitPost,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'What\'s happening?',
                ),
                maxLines: null,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (value) {
                  _content = value!;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
