import 'package:bul_coz_cek_game/ui/helper/U%C4%B0Helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ocr_screen.dart';

class QuestionScreen extends StatefulWidget {
  @override
  QuestionScreenState createState() => QuestionScreenState();
}

class QuestionScreenState extends State<QuestionScreen> {
  Color colorTrueAnswer = Colors.lightGreenAccent;
  Color colorFalseAnswer = Colors.red;
  bool? isTrueAnswer;

  bool answered = false;
  var buttonsMap = new  Map<int,bool>();
  int trueKey = 0;

  int clickedOption = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonsMap[1] =  false;
    buttonsMap[2] =  false;
    buttonsMap[3] =  true;
    buttonsMap[4] =  false;

    buttonsMap.forEach((key, value) {

      if(value == true){
        trueKey = key;
        debugPrint("TRUE KEY = $key");
      }

    });
  }


  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  "SORU 1",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  height: MediaQuery.of(context).size.height * .3,
                  width: MediaQuery.of(context).size.width * .8,
                  child: Text(
                    "${UiHelper.loremImpsum}",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () => {
                    debugPrint("1. OPTION ON PRESSED"),
                    answered = true,
                    clickedOption = 1,
                    setState(
                          () {},
                    )
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: (() {
                          if (answered == false) {
                            return Colors.white;
                          } else if (answered && trueKey == 1 && clickedOption == 1 ) {
                            return colorTrueAnswer;
                          } else if (answered && trueKey != 1 && clickedOption == 1  )  {
                            return colorFalseAnswer;
                          } else{
                             return Colors.white;
                          }
                        }()),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(25)),
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * .07,
                        maxWidth: MediaQuery.of(context).size.width * .8,
                        minHeight: MediaQuery.of(context).size.height * .001,
                        minWidth: MediaQuery.of(context).size.width * .8),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "${UiHelper.optionOne}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => {
                    debugPrint("2. OPTION ON PRESSED"),
                    answered = true,
                    clickedOption = 2,

                    setState(
                          () {},
                    )
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: (() {
                          if (answered == false) {
                            return Colors.white;
                          } else if (answered && trueKey == 2 && clickedOption == 2) {
                            return colorTrueAnswer;
                          } else if (answered && trueKey != 2 && clickedOption ==2)  {
                            return colorFalseAnswer;
                          } else{
                            return Colors.white;
                          }
                        }()),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(25)),
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * .07,
                        maxWidth: MediaQuery.of(context).size.width * .8,
                        minHeight: MediaQuery.of(context).size.height * .001,
                        minWidth: MediaQuery.of(context).size.width * .8),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "${UiHelper.optionTwo}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => {
                    debugPrint("3. OPTION ON PRESSED"),
                    answered = true,
                    clickedOption =3,
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1,
                            animation2) =>
                            OcrPage(
                            ),
                      ),
                    ),
                    setState(
                      () {},
                    )
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: (() {
                          if (answered == false) {
                            return Colors.white;
                          } else if (answered && trueKey == 3 && clickedOption ==3) {
                            return colorTrueAnswer;
                          } else if (answered && trueKey != 3 && clickedOption ==3 )  {
                            return colorFalseAnswer;
                          } else{
                            return Colors.white;
                          }
                        }()),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(25)),
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * .07,
                        maxWidth: MediaQuery.of(context).size.width * .8,
                        minHeight: MediaQuery.of(context).size.height * .001,
                        minWidth: MediaQuery.of(context).size.width * .8),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "${UiHelper.optionThree}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => {
                    debugPrint("4. OPTION ON PRESSED"),
                    answered = true,
                    clickedOption =4,
                    setState(
                          () {},
                    )
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: (() {
                          if (answered == false) {
                            return Colors.white;
                          } else if (answered && trueKey == 4 && clickedOption ==4 ) {
                            return colorTrueAnswer;
                          } else if (answered && trueKey != 4  && clickedOption ==4)  {
                            return colorFalseAnswer;
                          } else{
                            return Colors.white;
                          }
                        }()),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(25)),
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * .07,
                        minHeight: MediaQuery.of(context).size.height * .001,
                        maxWidth: MediaQuery.of(context).size.width * .8,
                        minWidth: MediaQuery.of(context).size.width * .8),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "${UiHelper.optionFour}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
