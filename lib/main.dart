import 'package:camera_deep_ar/camera_deep_ar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


const apiKey = "b905125adcfced9c7f40ed50b6ca860d1740ad3eba5986bf953082970522d6aaba7c7cb653dd40b0";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  CameraDeepArController cameraDeepArController;

  int effectCount =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CameraDeepAr(
              onCameraReady: (isReady) {

                setState(() {});
              },
              onImageCaptured: (path) {

                setState(() {});
              },
              onVideoRecorded: (path) {

                setState(() {});
              },
              androidLicenceKey:apiKey,
              iosLicenceKey:apiKey,

              cameraDeepArCallback: (c) async {
                cameraDeepArController = c;
                setState(() {

                });
              }),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () {
                cameraDeepArController.changeMask(effectCount);
                print(effectCount);
              if(effectCount<7)
                effectCount++;
              },
              child: Icon(Icons.navigate_next),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton(
              onPressed: () =>{
                cameraDeepArController.changeMask(effectCount),
                --effectCount
              },
              child: Icon(Icons.navigate_before),
            ),
          ),
        ],
      ),
    );
  }
}



