import 'dart:math';
import 'dart:ui' as ui;
import 'random_two_player_selection_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../helper/UİHelper.dart';

class EnterPlayerNamesScreen extends StatefulWidget {
  @override
  EnterPlayerNamesScreenState createState() => EnterPlayerNamesScreenState();
}

class EnterPlayerNamesScreenState extends State<EnterPlayerNamesScreen> {
  List<Widget> enterPlayerItemList = [];
  List<TextEditingController> usernameController = [];
  int myIndex = 0;
  List<String> playerNames = [];

  @override
  void initState() {
    // TODO: implement initState
    usernameController.add(new TextEditingController());
    enterPlayerItemList.add(enterPlayerItemWidget());
    super.initState();
  }

  Widget enterPlayerItemWidget() {
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
      child: TextField(
        controller: usernameController.last,
        autocorrect: true,
        decoration: InputDecoration(
          hintText: 'Enter Username',
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white70,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide(
              color: Color(0xff898989),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide(
              width: 1,
              color: Color(0xffff00b9),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 50, left: 10, bottom: 20),
              child: Text(
                "Oyuncu İsimlerini Giriniz ",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlueAccent),
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
                maxHeight: screenHeight * .65,
                minHeight: screenHeight * .2,
                minWidth: screenWidth * .2,
                maxWidth: screenWidth * .7),
            child: Scrollbar(
              isAlwaysShown: true,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: enterPlayerItemList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return enterPlayerItemList[index];
                  }),
            ),
          ),
          IconButton(
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                if (usernameController.last.text.isNotEmpty ||
                    usernameController.last.text.compareTo("") != 0) {
                  usernameController.add(new TextEditingController());
                  enterPlayerItemList.add(enterPlayerItemWidget());

                  /// kisiyi db ye kaydet


                } else {
                  Fluttertoast.showToast(
                      msg: "Lütfen önce tüm alanları doldurunuz",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Color(0xffff0000),
                      textColor: Colors.white,
                      fontSize: 16,
                      timeInSecForIosWeb: 3);

                  debugPrint("bos olamaz");
                }
                setState(() {});
              },
              icon: Icon(
                Icons.add_circle_outline_sharp,
                color: UiHelper.myPink,
                size: 50,
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 40),
              child: ElevatedButton(
                child: Text(
                  "KAYDET",
                ),
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Colors.lightBlueAccent,
                  onSurface: Colors.pink,
                  side: BorderSide(color: Colors.white, width: 0.5),
                  elevation: 4,
                  minimumSize: Size(160, 50),
                  shadowColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                onPressed: () {
                  for (int i = 0; i < usernameController.length; i++) {
                    debugPrint(
                        "Usernameontroller[${i + 1}. oyuncu]: ${usernameController[i].text}");
                    playerNames.add(usernameController[i].text);
                  }
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          RandomTwoPlayerSelectionPage(
                        playerNames: playerNames,
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
