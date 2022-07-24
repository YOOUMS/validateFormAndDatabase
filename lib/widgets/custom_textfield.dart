import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class custome_Textfield extends StatelessWidget {
  Function vlidate;
  String title;
  TextEditingController controller;
  TextInputType type;
  custome_Textfield(
      {required this.title,
      required this.controller,
      required this.type,
      required this.vlidate,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      validator: (value) {
        return vlidate(value);
      },
      decoration: InputDecoration(hintText: title),
    );
  }
}
