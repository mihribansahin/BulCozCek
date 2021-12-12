import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ocr_camera/ocr_camera_widget.dart';
import 'dart:io';

import 'package:camera/camera.dart';
class OcrPage extends StatefulWidget {
  @override
  OcrPageState createState() => OcrPageState();
}

class OcrPageState extends State<OcrPage> {
 late List<CameraDescription> _cameras;
  String _imgPath = '';

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("asda"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Visibility(
          visible: _imgPath.isNotEmpty,
          child: Image.file(
            File(_imgPath),
            width: _size.width,
            height: _size.height,
            fit: BoxFit.cover,
          ),
          replacement: Text('Image empty!'),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () async {
                  _cameras = await availableCameras();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OCRCameraWidget(
                                camera: _cameras,
                                maskType: MaskType.selfie,
                                onResult: (XFile? value) {
                                  setState(() {
                                    _imgPath = value!.path;
                                    debugPrint("Mihri: ${value.name}" );

                                  });
                                  debugPrint("Mihrid: ${value.toString()}" );

                                  print('XFile ----> ${value!.path}',
                                  );
                                },
                              )));
                },
                child: Text('Take a selfie'),
              ),
              TextButton(
                onPressed: () async {
                  _cameras = await availableCameras();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OCRCameraWidget(
                                camera: _cameras,
                                secondDescription: "aşdslgşfhişdfi",
                                onResult: (XFile? value) async {
                                  setState(() {
                                    _imgPath = value!.path;

                                  });
                                  debugPrint("Mihri: ${value!.name}" );

                                  value.readAsString().then((value) =>
                                  {debugPrint("Mihriid: ${value}")});


                                  print(
                                    'XFile ----> ${value.path}',
                                  );
                                },
                              ),),);
                },
                child: Text('Take a photo'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
