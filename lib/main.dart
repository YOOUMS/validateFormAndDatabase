import 'package:flutter/material.dart';
import 'package:validation_form/HomePage.dart';
import 'package:validation_form/SPHelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpHelper.initS();
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
