// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share/share.dart';
import 'package:get/get.dart';

class ShareData extends StatefulWidget {
  const ShareData({Key key}) : super(key: key);

  @override
  ShareDataState createState() => ShareDataState();
}

class ShareDataState extends State<ShareData> {
  String text = 'SHARE PESAN INI';
  String subject = '';
  List<String> imagePaths = [];

  @override
  Widget build(BuildContext context) {
    String pickedFile = imagePaths == null ? "" : imagePaths.toString();
    String trimmedFileName = pickedFile.split("/").last;
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Isi Text Anda",
                    hintStyle: TextStyle(
                        color: Color(0xFF9b9b9b),
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                    labelText: "Isi Text Untuk Dishare",
                    labelStyle: TextStyle(
                      color: Color(0xFF9b9b9b),
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF9b9b9b)),
                        borderRadius: BorderRadius.circular(5)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF9b9b9b)),
                        borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Color(0xFF6658F6),
                        width: 2,
                      ),
                    ),
                  ),
                  maxLines: 2,
                  onChanged: (String value) => setState(() {
                    text = value;
                  }),
                ),
                const Padding(padding: EdgeInsets.only(top: 12.0)),
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text("Pilih Image"),
                  onTap: () async {
                    final imagePicker = ImagePicker();
                    final pickedFile = await imagePicker.getImage(
                      source: ImageSource.gallery,
                    );
                    if (pickedFile != null) {
                      setState(() {
                        imagePaths.add(pickedFile.path);
                      });
                    }
                  },
                ),
                Text(imagePaths == null ? "" : trimmedFileName),
                const Padding(padding: EdgeInsets.only(top: 12.0)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Builder(
                      builder: (BuildContext context) {
                        return ElevatedButton(
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
                              "Share",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textScaleFactor: 1,
                            ),
                            onPressed: text.isEmpty && imagePaths.isEmpty
                                ? null
                                : () => _onShareData(context));
                        // RaisedButton(
                        //   color: Color(0xFF6658F6),
                        //   child: const Text(
                        //     'Share',
                        //     style: TextStyle(
                        //         fontSize: 15,
                        //         fontWeight: FontWeight.bold,
                        //         color: Colors.white),
                        //     textScaleFactor: 1,
                        //   ),
                        //   onPressed: text.isEmpty && imagePaths.isEmpty
                        //       ? null
                        //       : () => _onShareData(context),
                        // );
                      },
                    ),
                    const Padding(padding: EdgeInsets.only(top: 12.0)),
                    Builder(
                      builder: (BuildContext context) {
                        return ElevatedButton(
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
                            "Share Tanpa Data",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textScaleFactor: 1,
                          ),
                          onPressed: () => _onShareWithEmptyFields(context),
                        );
                        // RaisedButton(
                        //   color: Color(0xFF6658F6),
                        //   child: const Text('Share tanpa data'),
                        //   onPressed: () => _onShareWithEmptyFields(context),
                        // );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  _onShareData(BuildContext context) async {
    final RenderBox box = context.findRenderObject();

    if (imagePaths.isNotEmpty) {
      await Share.shareFiles(imagePaths,
          text: text,
          subject: subject,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share(text,
          subject: subject,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }
  }

  _onShareWithEmptyFields(BuildContext context) async {
    await Share.share("text");
  }
}
