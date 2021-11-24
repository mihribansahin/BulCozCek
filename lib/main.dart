import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bul_coz_cek_game/app_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'database/db.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  db d = new db();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (d.database == null) {
      d.database;
      debugPrint(" KONTROL ! DB null ve içeri girdi, db oluşturdu. ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Clean Code',
        home: AnimatedSplashScreen(
            duration: 2000,
            splashIconSize: 100,
            splash: splashWidget(),
            nextScreen: AppInfoScreen(),
            splashTransition: SplashTransition.rotationTransition,
            pageTransitionType: PageTransitionType.rightToLeft,
            backgroundColor: Color(0xffff0074)
        )
    );
  }

   splashBackground(){
    return  Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: <Color>[
            //  Color(0xfff660ab),
            //  Color(0xff500030),
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
    );
  }

  Widget splashWidget(){
    return Stack(
      children: [

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
    );
  }
}


