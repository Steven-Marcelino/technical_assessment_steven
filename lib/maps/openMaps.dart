// ignore_for_file: file_names, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:technical_assessment_steven/maps/maps.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class OpenMaps extends StatefulWidget {
  const OpenMaps({Key key}) : super(key: key);

  @override
  _OpenMapsState createState() => _OpenMapsState();
}

class _OpenMapsState extends State<OpenMaps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onTap: () => Get.back(),
        ),
      ),
      body: Center(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: LottieBuilder.asset("assets/openMaps.json"),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.25,
              ),
              child: Text(
                "Klik tombol dibawah ini \nuntuk melanjutkan!!",
                textScaleFactor: 1,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            InkWell(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.5,
                // padding: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                  color: Color(0xFF6658F6),
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    "Lanjutkan",
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              onTap: () => Utils.openLink(
                  url:
                      'https://www.google.co.id/maps/place/Central+Park/@-6.1758701,106.7875701,16z/data=!4m9!1m2!2m1!1scentral+park+mall+-+jakarta+barat!3m5!1s0x2e69f6f5802f381d:0xe816d65037c3207a!8m2!3d-6.1773686!4d106.7906723!15sCiFjZW50cmFsIHBhcmsgbWFsbCAtIGpha2FydGEgYmFyYXRaISIfY2VudHJhbCBwYXJrIG1hbGwgamFrYXJ0YSBiYXJhdJIBD3Nob3BwaW5nX2NlbnRlcg'),
            ),
          ],
        ),
      )),
    );
  }
}
