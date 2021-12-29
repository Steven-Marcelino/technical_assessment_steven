// ignore_for_file: file_names, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:technical_assessment_steven/TileWidget.dart';

import '../mediaSource.dart';

class GalleryButtonWidget extends StatelessWidget {
  const GalleryButtonWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTileWidget(
        text: 'Lanjutkan',
        onClicked: () => pickGalleryMedia(context),
      );

  Future pickGalleryMedia(BuildContext context) async {
    final MediaSource source = ModalRoute.of(context).settings.arguments;

    final getMedia = source == MediaSource.image
        // ignore: deprecated_member_use
        ? ImagePicker().getImage
        // ignore: deprecated_member_use
        : ImagePicker().getVideo;

    final media = await getMedia(source: ImageSource.gallery);
    final file = File(media.path);

    Navigator.of(context).pop(file);
  }
}
