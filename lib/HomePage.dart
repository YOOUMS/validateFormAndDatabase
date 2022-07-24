import 'dart:convert';
import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:validation_form/SPHelper.dart';
import 'package:validation_form/widgets/custom_textfield.dart';

import 'detailScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formState = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    emptyvalidate(String value) {
      if (value.isEmpty || value == null) return 'this field is requierd';
    }

    nameValidate(String value) {
      emptyvalidate(value);
      if (value.length < 3) return 'name must be larger then 3';
    }

    emailValidte(String value) {
      emptyvalidate(value);
      if (!value.contains('@') || !value.contains('.com'))
        return 'Invalid email';
    }

    return Scaffold(
      body: Form(
        key: _formState,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            custome_Textfield(
                title: 'name',
                controller: nameController,
                type: TextInputType.name,
                vlidate: nameValidate),
            custome_Textfield(
                title: 'email',
                controller: emailController,
                type: TextInputType.emailAddress,
                vlidate: emailValidte),
            Row(
              children: [
                Container(
                  width: 200,
                  child: custome_Textfield(
                      title: 'phone',
                      controller: phoneController,
                      type: TextInputType.phone,
                      vlidate: nameValidate),
                ),
                CountryCodePicker(
                  initialSelection: 'ps',
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formState.currentState!.validate()) {
                    Map User = {
                      'name': nameController.text,
                      'email': emailController.text,
                      'phone': phoneController.text
                    };
                    String stringUser = json.encode(User);
                    SpHelper.setUser(stringUser);
                    nameController.text = '';
                    emailController.text = '';
                    phoneController.text = '';
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return InfoScreen();
                    }));
                  }
                },
                child: Text("Sign in")),
            ElevatedButton(
                onPressed: () {
                  Map? user = SpHelper.getUser();
                  user == null
                      ? log("this is your first time")
                      : log(user.toString());
                },
                child: Text("Check User"))
          ]),
        ),
      ),
    );
  }
}
