// ignore_for_file: file_names, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:technical_assessment_steven/openGallery/gallery.dart';
import 'package:get/get.dart';

class OpenGallery extends StatelessWidget {
  const OpenGallery({Key key}) : super(key: key);

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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: LottieBuilder.asset(
                  "assets/openGallery.json",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.25,
              ),
              child: Text(
                "Klik tombol dibawah ini \nuntuk melanjutkan!!",
                textAlign: TextAlign.center,
                textScaleFactor: 1,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.6,
                // padding: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                  color: Color(0xFF6658F6),
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: GalleryButtonWidget()),
          ],
        ),
      ),
    );
  }
}
