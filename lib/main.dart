import 'package:bmi_calculate/bmi_result_screen.dart';
import 'package:bmi_calculate/bmi_screen.dart';
import 'package:flutter/material.dart';

void main () {
  runApp( MyApp() );
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: bmi_screen(),
    );
  }
}
