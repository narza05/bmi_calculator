// ignore_for_file: prefer_const_constructors
import 'package:course12/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:course12/reusable_container.dart';
import 'package:course12/reusable_icon.dart';
import 'constants.dart';
import 'package:course12/calculator.dart';

enum gendertype {
  male,
  female,
}

class inputpage extends StatefulWidget {
  @override
  _inputpageState createState() => _inputpageState();
}

class _inputpageState extends State<inputpage> {
  gendertype? select;
  int height = 170;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Reusecontainer(
                      select == gendertype.male ? kActivecolor : kInactivecolor,
                      reusable_column(FontAwesomeIcons.mars, 'MALE'),
                      () {
                        setState(() {
                          select = gendertype.male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: Reusecontainer(
                      select == gendertype.female
                          ? kActivecolor
                          : kInactivecolor,
                      reusable_column(FontAwesomeIcons.venus, 'FAMALE'),
                      () {
                        setState(() {
                          select = gendertype.female;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Reusecontainer(
                  kInactivecolor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: kTextstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumberstyle,
                          ),
                          Text(
                            'cm',
                            style: kTextstyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                          overlayColor: Color(0x50EB1555),
                          thumbColor: Colors.pink,
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.grey,
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          onChanged: (double newvalue) {
                            setState(() {
                              height = newvalue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  () {}),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Reusecontainer(
                        kInactivecolor,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT'.toString(),
                              style: kTextstyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberstyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                roundiconbutton(FontAwesomeIcons.minus, () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                                roundiconbutton(FontAwesomeIcons.plus, () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                              ],
                            ),
                          ],
                        ),
                        () {}),
                  ),
                  Expanded(
                      child: Reusecontainer(
                          kInactivecolor,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'AGE'.toString(),
                                style: kTextstyle,
                              ),
                              Text(
                                age.toString(),
                                style: kNumberstyle,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  roundiconbutton(FontAwesomeIcons.minus, () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                                  roundiconbutton(FontAwesomeIcons.plus, () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                                ],
                              ),
                            ],
                          ),
                          () {})),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){

                Calculator cal = Calculator(height, weight);

                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Resultpage(
                    cal.calculate(),
                      cal.getresulttext(),
                      cal.getresultsummary()
                  );
                }));

              },
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
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
      ),
    );
  }
}

// class Bottombutton extends StatelessWidget {
//   Bottombutton(@required this.text,@required this.ontap);
//
//   final String text;
//   final Function ontap;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: ontap(),
//       child: Container(
//
//         child: Center(
//           child: Text(text,
//           style: kBottombuttomstyle,
//           ),
//         ),
//         color: kBottomcontainercolor,
//         margin: EdgeInsets.only(top: 10),
//         width: double.infinity,
//         height: kBottomcontainerheight,
//       ),
//     );
//   }
// }

class roundiconbutton extends StatelessWidget {
  roundiconbutton(@required this.icon, @required this.onpressed);

  final IconData icon;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onpressed();
      },
      elevation: 8,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff1D1E33),
    );
  }
}
