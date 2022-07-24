import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:validation_form/SPHelper.dart';

class InfoScreen extends StatelessWidget {
  InfoScreen({Key? key}) : super(key: key);
  Map? User = SpHelper.getUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Info")),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(User!['name'].toString()),
              Text(User!['email'].toString()),
              Text(User!['phone'].toString()),
              ElevatedButton(
                  onPressed: () {
                    SpHelper.deleteData();
                  },
                  child: Text('Signout')),
            ]),
      ),
    );
  }
}
