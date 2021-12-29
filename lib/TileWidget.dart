// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final String text;

  final VoidCallback onClicked;

  const ListTileWidget({
    @required this.text,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        contentPadding: EdgeInsets.symmetric(),
        title: Center(
          child: Text(
            text,
            textScaleFactor: 1,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        onTap: onClicked,
      );
}
