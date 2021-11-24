import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


///TODO: Bu sayfada önceki sayfada eklenen kişiler arasında 2 kişi random olarakseçilir ve kullanıcıya sunulur
///progress duuration ile3 saniye formaliteden göster
///
class RandomTwoPlayerSelectionPage extends StatefulWidget {
  List<String> playerNames = [];

  @override
  RandomTwoPlayerSelectionPageState createState() =>
      RandomTwoPlayerSelectionPageState();

  RandomTwoPlayerSelectionPage({required this.playerNames});
}

class RandomTwoPlayerSelectionPageState
    extends State<RandomTwoPlayerSelectionPage> {
  List<Widget> enterPlayerItemList = [];
  List<TextEditingController> usernameController = [];
  int myIndex = 0;
  bool visibilityProgress = true;
  final random = new Random();
  String item1 = "";
  String item2 = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    visibilityProgress = true;
    for (int i = 0; i < widget.playerNames.length; i++) {
      debugPrint("player names $i ${widget.playerNames[i]}");
    }

    item1 = widget.playerNames[random.nextInt(widget.playerNames.length)];
    item2 = widget.playerNames[random.nextInt(widget.playerNames.length)];

    print("item 1: $item1, item 2: $item2");

    Future.delayed(
      const Duration(seconds: 4),
      () {
        if (this.mounted) {
          setState(() {
            visibilityProgress = false;
          });
        }
      },
    );
  }

  Widget myProgressWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40)),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.shade100,
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: CircularProgressIndicator(
            color: Color.fromARGB(255, 52, 197, 255),
            strokeWidth: 4,
          )),
          Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 30, bottom: 20),
              child: Text(
                "Rasgele 2 Oyuncu Seçiliyor. \n Lütfen Bekleyiniz!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  myDelayFunc() async {
    visibilityProgress = true;

    Future.delayed(Duration(milliseconds: 5000));
    visibilityProgress = false;
    setState(
      () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      //  backgroundColor: Color(0xffff4800),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 6, 100, 139),
            Color.fromARGB(255, 9, 99, 135),
            Color.fromARGB(255, 9, 99, 135),
            Color.fromARGB(255, 255, 218, 247),
          ],
        )),
        constraints: BoxConstraints(
            minHeight: screenHeight * .98, maxHeight: screenHeight * 1),
        child: Center(
          child: ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Visibility(
                visible: visibilityProgress,
                child: Container(child: myProgressWidget()),
              ),
              Visibility(
                visible: !visibilityProgress,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.pink.shade100,
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(0, 0), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              item1,
                              style: TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ),
                        Text("VS", style: TextStyle(fontSize: 60, color: Colors.white),),

                        Container(
                          height: 100,
                          width: 100,
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.pink.shade100,
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(0, 0), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              item2,
                              style: TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
