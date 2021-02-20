import 'dart:io';

import 'package:flutter/material.dart';

class PreviewScreen extends StatelessWidget {
  final memo;

  PreviewScreen({Key key, @required this.memo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: convertDateTimeToDate(memo.createdAt),
          backgroundColor: memo.isPositive? Colors.blue: Colors.red,
        ),
        body: Image.file(File("${memo.path}")),
      ),
    );
  }

  Text convertDateTimeToDate(DateTime createdAt) {
    if (createdAt.year == DateTime.now().year) {
      return Text("${createdAt.month}月${createdAt.day}日  ${createdAt.hour}:${createdAt.minute}");
    } else {
      return Text("${createdAt.year}年${createdAt.month}月${createdAt.day}日  ${createdAt.hour}:${createdAt.minute}");
    }
  }
}
