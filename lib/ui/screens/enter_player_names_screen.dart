import 'dart:math';
import 'dart:ui' as ui;
import 'package:bul_coz_cek_game/database/collection/collection.dart';
import 'package:bul_coz_cek_game/database/user_item.dart';
import 'package:bul_coz_cek_game/ui/helper/U%C4%B0Helper.dart';

import 'random_two_player_selection_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EnterPlayerNamesScreen extends StatefulWidget {
  @override
  EnterPlayerNamesScreenState createState() => EnterPlayerNamesScreenState();
}

class EnterPlayerNamesScreenState extends State<EnterPlayerNamesScreen> {
  List<Widget> enterPlayerItemList = [];
  List<TextEditingController> usernameController = [];
  int myIndex = 0;
  int temp = 0;
  List<String> playerNames = [];

  @override
  void initState() {
    // TODO: implement initState
    usernameController.add(new TextEditingController());

    super.initState();
  }

  Widget enterPlayerItemWidget(BuildContext? context, int index) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context!).size.width * .75,
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
          ),
          Container(
              width: MediaQuery.of(context).size.width * .1,
              child: IconButton(onPressed: () {

                debugPrint("silinen item index : $index");

              }, icon: Icon(Icons.delete)))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    if (temp == 0) {
      enterPlayerItemList.add(enterPlayerItemWidget(context, 0));
      temp = 1;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          shrinkWrap: true,
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
                  maxWidth: screenWidth * .8),
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
                    enterPlayerItemList.add(enterPlayerItemWidget(context, enterPlayerItemList.length));

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
                margin:
                    EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 40),
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
                  onPressed: () async {
                    for (int i = 0; i < usernameController.length; i++) {
                      UserItem userItemObj = UserItem();
                      debugPrint(
                          "Usernameontroller[${i + 1}. oyuncu]: ${usernameController[i].text}");
                      userItemObj.username = usernameController[i].text;
                      userItemObj.point = 88;
                      User.userCount()
                          .then((value) => {userItemObj.id = value! + 1});

                      await User.findUsername(usernameController[i].text)
                          .then((value) => {
                                for (int i = 0; i < value.length; i++)
                                  {
                                    debugPrint(
                                        'db finder username ${value[i].username}'),
                                  },
                                if (value.isEmpty || value.length <= 0)
                                  {
                                    debugPrint("kisi daha once kayıt olmamış"),
                                    if (usernameController[i].text.isNotEmpty ||
                                        usernameController[i].text.length > 0)
                                      {
                                        User.save(userItemObj),
                                        Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation1,
                                                    animation2) =>
                                                RandomTwoPlayerSelectionPage(
                                              playerNames: playerNames,
                                            ),
                                          ),
                                        ),
                                      }
                                    else
                                      {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Kullanıcı adı boş kaydedilemez !",
                                            backgroundColor: Colors.red),
                                      },
                                  }
                                else if (value.length > 0)
                                  {
                                    Fluttertoast.showToast(
                                        msg:
                                            "${usernameController[i].text}  kullanıcısı zaten var. ",
                                        backgroundColor: Colors.pink),
                                  }
                              });

                      ///TODO:  her şartta save a girmesin!!
                      //    User.save(userItemObj);

                      await User.finAlldUser().then((value) => {
                            for (int i = 0; i < value.length; i++)
                              {
                                debugPrint(
                                    "bulunan db user name : ${value[i].username} puanı : ${value[i].point}"),
                                playerNames.add(value[i].username!),
                              }
                          });
                      //playerNames.add(usernameController[i].text);
                    }
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
