// ignore_for_file: prefer_const_constructors
import 'package:course12/constants.dart';
import 'package:course12/reusable_container.dart';
import 'package:flutter/material.dart';
import 'package:course12/input_page.dart';
import 'package:course12/calculator.dart';

class Resultpage extends StatelessWidget {
  Resultpage(@required this.result,@required this.resulttext,@required this.resultsummary);

  final String resulttext;
  final String result;
  final String resultsummary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMIcalculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'YOUR RESULT',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reusecontainer(
                kInactivecolor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resulttext,
                      style: kResulttextstyle,
                    ),
                    Text(
                      result,
                      style: kResultnumberstyle,
                    ),
                    Text(
                      resultsummary,
                      style: kTextstyle,
                    ),
                  ],
                ),
                () {}),
          ),

      GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Container(
          child: Center(
            child: Text(
              'RE-CALCULATE',
              style: kBottombuttomstyle,
            ),
          ),
          color: kBottomcontainercolor,
          margin: EdgeInsets.only(top: 10),
          width: double.infinity,
          height: kBottomcontainerheight,
        ),
      ),
        ],
      ),
    );
  }
}
