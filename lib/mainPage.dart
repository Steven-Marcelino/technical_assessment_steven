// ignore_for_file: file_names, missing_required_param, prefer_const_constructors, unnecessary_this, unused_import, prefer_const_declarations

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:technical_assessment_steven/OpenCamera/camera.dart';
import 'package:technical_assessment_steven/formInput/input.dart';
import 'package:get/get.dart';
import 'package:technical_assessment_steven/locationGPS/location.dart';
import 'package:technical_assessment_steven/login/loginGoogle.dart';
import 'package:technical_assessment_steven/maps/openMaps.dart';
import 'package:technical_assessment_steven/share/share.dart';
import 'maps/maps.dart';
import 'package:technical_assessment_steven/mediaSource.dart';
import 'OpenCamera/openCamera.dart';
import 'package:technical_assessment_steven/openGallery/openGallery.dart';
import 'TileWidget.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  File fileMedia;
  MediaSource source;
  @override
  void initState() {
    super.initState();

    // _loadUserData();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  side: BorderSide(
                    color: Color(0xFF6658F6),
                  ),
                  primary: Color(0xFF6658F6),
                ),
                child: Text(
                  "Form Input",
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                onPressed: () {
                  Get.to(() => FormInput());
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => FormInput()));
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  side: BorderSide(
                    color: Color(0xFF6658F6),
                  ),
                  primary: Color(0xFF6658F6),
                ),
                child: Text(
                  "Open Camera",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textScaleFactor: 1,
                ),
                onPressed: () => capture(MediaSource.image)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  side: BorderSide(
                    color: Color(0xFF6658F6),
                  ),
                  primary: Color(0xFF6658F6),
                ),
                child: Text(
                  "Open Google Maps with Cordinates",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textScaleFactor: 1,
                ),
                onPressed: () {
                  Get.to(() => OpenMaps());
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  side: BorderSide(
                    color: Color(0xFF6658F6),
                  ),
                  primary: Color(0xFF6658F6),
                ),
                child: Text(
                  "Take Current GPS Location",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textScaleFactor: 1,
                ),
                onPressed: () {
                  Get.to(() => Location());
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  side: BorderSide(
                    color: Color(0xFF6658F6),
                  ),
                  primary: Color(0xFF6658F6),
                ),
                child: Text(
                  "Open Gallery Media",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textScaleFactor: 1,
                ),
                onPressed: () => gallery(MediaSource.image)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  side: BorderSide(
                    color: Color(0xFF6658F6),
                  ),
                  primary: Color(0xFF6658F6),
                ),
                child: Text(
                  "Login With Google",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textScaleFactor: 1,
                ),
                onPressed: () {
                  Get.to(() => LoginGoogle());
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  side: BorderSide(
                    color: Color(0xFF6658F6),
                  ),
                  primary: Color(0xFF6658F6),
                ),
                child: Text(
                  "Share This Apps",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textScaleFactor: 1,
                ),
                onPressed: () {
                  Get.to(() => ShareData());
                }),
          ],
        ),
      ),
    );
  }

  // Future<void> openUrl(String url,
  //     {bool forceWebView = false, bool enableJavaScript = false}) async {
  //   await launch(url);
  // }

  Future capture(MediaSource source) async {
    setState(() {
      this.source = source;
      this.fileMedia = null;
    });

    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => OpenCamera(),
        settings: RouteSettings(
          arguments: source,
        ),
      ),
    );

    if (result == null) {
      return;
    } else {
      setState(() {
        fileMedia = result;
      });
    }
  }

  Future gallery(MediaSource source) async {
    setState(() {
      this.source = source;
      this.fileMedia = null;
    });

    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => OpenGallery(),
        settings: RouteSettings(
          arguments: source,
        ),
      ),
    );

    if (result == null) {
      return;
    } else {
      setState(() {
        fileMedia = result;
      });
    }
  }
}
