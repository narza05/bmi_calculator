import 'dart:math';
import 'package:flutter/material.dart';

class Calculator {
  Calculator (@required this.height, @required this.weight);

  final int height;
  final int weight;
  double _bmi=0;

  String calculate(){
    _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getresulttext(){
    if(_bmi>=25){
      return 'Overweight';
    }
    else if(_bmi>=18.5){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }

  String getresultsummary(){
    if(_bmi>=25){
      return 'Do Exercise';
    }
    else if(_bmi>=18.5){
      return 'Have Fun';
    }
    else{
      return 'Eat More';
    }
  }
}

