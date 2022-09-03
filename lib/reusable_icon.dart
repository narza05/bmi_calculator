import 'package:flutter/material.dart';
import 'constants.dart';

class reusable_column extends StatelessWidget {
  reusable_column(this.a,this.b);
  final IconData a;
  final String b;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          a,
          size: 80,
        ),
        // SizedBox(
        //   height: 10,
        // ),
        Text(
            style: kTextstyle,
            b),
      ],
    );
  }
}