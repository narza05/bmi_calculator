// ignore_for_file: prefer_const_constructors
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import'package:flutter/material.dart';
import 'package:course12/input_page.dart';

void main(){
  runApp(BMIcalculator());
}

class BMIcalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0A0E21),
        scaffoldBackgroundColor: Color(0xff0A0E21),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          ), ),
        appBarTheme: AppBarTheme(
          color: Color(0xff0A0E21),
        ),
      ),
      home: inputpage(),
    );
  }
}


