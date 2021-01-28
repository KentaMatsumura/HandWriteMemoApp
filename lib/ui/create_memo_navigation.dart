import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:handwrite_memo_app/entity/memo.dart';
import 'package:handwrite_memo_app/model/image_model.dart';
import 'package:handwrite_memo_app/model/image_path_model.dart';
import 'package:handwrite_memo_app/model/memo_model.dart';
import 'package:handwrite_memo_app/model/strokes_model.dart';
import 'package:handwrite_memo_app/ui/paper_screen.dart';
import 'package:handwrite_memo_app/utils/utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import "package:intl/intl.dart";
import 'package:intl/date_symbol_data_local.dart';

class CreateMemoNavigation extends StatelessWidget {
  final receive;

  CreateMemoNavigation({Key key, @required this.receive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final strokes = Provider.of<StrokesModel>(context);
    final pageKey = Provider.of<ImageModel>(context);
    final model = Provider.of<MemoModel>(context, listen: true);
    Color color = receive[1] ? Colors.blue : Colors.red;

    void saveImage(String imageName) async {
      pageKey.pngByte = await Utils.capture(pageKey.key);
      final String dir = (await getApplicationDocumentsDirectory()).path;
      final String fullPath = '$dir/$imageName';
      File capturedFile = File(fullPath);
      await capturedFile.writeAsBytes(pageKey.pngByte);
      await GallerySaver.saveImage(capturedFile.path);
      ImagePathModel();
      // debugPrint("dirPath: $dir");
      // debugPrint("fullPath: $capturedFile");
      // debugPrint("saveImage: ${capturedFile.path}");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(receive[0]),
        backgroundColor: color,
        actions: [
          IconButton(
              icon: Icon(Icons.save_alt),
              onPressed: () async {
                if (strokes.drawList.isNotEmpty) {
                  DateTime now = DateTime.now();
                  String imageName = convertDateTimeToImageName(now);
                  saveImage(imageName);
                  model.add(Memo(
                      fileName: imageName,
                      createdAt: now,
                      isPositive: receive[1]));
                  Navigator.pop(context);
                }
              })
        ],
      ),
      body: PaperScreen(),
    );
  }

  String convertDateTimeToImageName(DateTime now) {
    initializeDateFormatting("ja_JP");
    var formatter = new DateFormat('yyyy_MM_dd_HH_mm_ss', "ja_JP");
    var formatted = formatter.format(now); // DateからString
    var imageName = "AppName_$formatted.png";
    return imageName;
  }
}

// 使ってない
class InputText extends StatelessWidget {
  final isPositive;

  InputText({Key key, @required this.isPositive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MemoModel>(context, listen: true);
    final textEditingController = TextEditingController();
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(8.0))),
            child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter your task",
                contentPadding: EdgeInsets.all(8),
              ),
            ),
          ),
        ),
        Container(
          child: RaisedButton(
            color: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(8.0))),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.add, color: Colors.white),
            ),
            onPressed: () {
              if (textEditingController.text.isNotEmpty) {
                model.add(Memo(
                    fileName: textEditingController.text,
                    createdAt: DateTime.now(),
                    isPositive: this.isPositive));
                Navigator.pop(context);
              }
            },
          ),
        )
      ],
    );
  }
}
