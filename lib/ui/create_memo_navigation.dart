import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/entity/memo.dart';
import 'package:handwrite_memo_app/model/memo_model.dart';
import 'package:provider/provider.dart';

class CreateMemoNavigation extends StatelessWidget {
  final receive;

  CreateMemoNavigation({Key key, @required this.receive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return mainMemoScreen(receive[0], receive[1]);
  }
}

Scaffold mainMemoScreen(String text, bool isPositive) {
  Color color = isPositive ? Colors.blue : Colors.red;
  return Scaffold(
    appBar: AppBar(
      title: Text(text),
      backgroundColor: color,
    ),
    body: Column(
      children: [
        InputText(isPositive: isPositive),
      ], // ペイント機能のウィジェット
    ),
    // floatingActionButton: ,  // redo, undo, clearボタン
  );
}

// サンプル
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
