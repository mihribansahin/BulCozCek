import 'dart:ui' as ui;
import 'package:bul_coz_cek_game/ui/helper/U%C4%B0Helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'enter_player_names_screen.dart';

class AppInfoScreen extends StatefulWidget {
  @override
  AppInfoScreenState createState() => AppInfoScreenState();
}

class AppInfoScreenState extends State<AppInfoScreen>
    with TickerProviderStateMixin {
  Animation? sizeAnimation;
  Animation? colorAnimation;
  AnimationController? controller;
  bool goNextPage = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    sizeAnimation = Tween(begin: 100.0, end: 400.0).animate(
        CurvedAnimation(parent: controller!, curve: Interval(0.0, 0.5)));
    colorAnimation = ColorTween(begin: Colors.white, end: Colors.transparent)
        .animate(
            CurvedAnimation(parent: controller!, curve: Interval(0.5, 1.0)));

    //loadLanguageFolder();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(

            margin: EdgeInsets.only(left: 30, top: 50, right: 30, bottom: 50),
            height: screenHeight,
            width: screenWidth,
            constraints: BoxConstraints(
              maxHeight: screenHeight*.8,
              maxWidth: screenWidth*.8,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.pink.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(

                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "Nasıl Oynanır ?",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlueAccent),
                    ),
                  ),
                ),

                Scrollbar(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 5, top: 10, right: 5, bottom: 10),
                  constraints: BoxConstraints(
                    maxHeight: screenHeight*.5,
                  ),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Text(
                            UiHelper.loremImpsum,
                            style: TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(left: 20,right: 20, bottom: 20),
                    child: ElevatedButton(
                      child: Text("ANLADIM"),
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Colors.lightBlueAccent,
                        onSurface: Colors.pink,
                        side: BorderSide(color: Colors.white, width: 0.5),
                        elevation: 4,
                        minimumSize: Size(160, 50),
                        shadowColor: Colors.pink,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) => EnterPlayerNamesScreen(),
                            transitionDuration: Duration.zero,
                          ),
                        );
                      },

                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
