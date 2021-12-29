// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:technical_assessment_steven/TileWidget.dart';

import '../mediaSource.dart';

class CameraButtonWidget extends StatelessWidget {
  const CameraButtonWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTileWidget(
        text: "Lanjutkan",
        onClicked: () => pickCameraMedia(context),
      );

  Future pickCameraMedia(BuildContext context) async {
    final MediaSource source = ModalRoute.of(context).settings.arguments;

    final getMedia = source == MediaSource.image
        ? ImagePicker().getImage
        : ImagePicker().getVideo;

    final media = await getMedia(source: ImageSource.camera);
    final file = File(media.path);

    Navigator.of(context).pop(file);
  }
}
