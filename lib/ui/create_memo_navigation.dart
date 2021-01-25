import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:handwrite_memo_app/entity/memo.dart';
import 'package:handwrite_memo_app/model/key_model.dart';
import 'package:handwrite_memo_app/model/memo_model.dart';
import 'package:handwrite_memo_app/model/strokes_model.dart';
import 'package:handwrite_memo_app/ui/paper_screen.dart';
import 'package:handwrite_memo_app/ui/parts/widget_to_image.dart';
import 'package:handwrite_memo_app/utils/utils.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class CreateMemoNavigation extends StatelessWidget {
  final receive;

  CreateMemoNavigation({Key key, @required this.receive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final strokes = Provider.of<StrokesModel>(context);
    final pageKey = Provider.of<KeyModel>(context);
    Color color = receive[1] ? Colors.blue : Colors.red;

    return Scaffold(
        appBar: AppBar(
          title: Text(receive[0]),
          backgroundColor: color,
          actions: [
            IconButton(
                icon: Icon(Icons.save_alt),
                onPressed: () async {
                  debugPrint("key: ===${pageKey.key}===");
                  final pageByte = await Utils.capture(pageKey.key);
                  debugPrint("byte: ===$pageByte===");
                })
          ],
        ),
        body: WidgetToImage(builder: (key) {
          pageKey.key = key;
          return PaperScreen();
        }));
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
                    text: textEditingController.text,
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
