import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
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
        AnimationController(vsync: this, duration: Duration(seconds: 5));

    sizeAnimation = Tween(begin: 100.0, end: 400.0).animate(
        CurvedAnimation(parent: controller!, curve: Interval(0.0, 0.5)));
    colorAnimation = ColorTween(begin: Colors.white, end: Colors.transparent)
        .animate(
            CurvedAnimation(parent: controller!, curve: Interval(0.5, 1.0)));

    //loadLanguageFolder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: <Color>[
                  // Color(0xfff660ab),
                  //    Color(0xff500030),
                  //  Color(0xffd245ba),
                  //  Color(0xfff5f5f5),
                  Color(0xffF0134D),
                  Color(0xffFF0075),
                  Color(0xcbfaffb7),

                  //  Color(0xffff5c2f),s

                  // Color(0xffceffe8)
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "ÇÖZ-BUL",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 26),
                  ),
                ),
                Container(
                  child: Text(
                    "ÇEK",
                    style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 55),
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
