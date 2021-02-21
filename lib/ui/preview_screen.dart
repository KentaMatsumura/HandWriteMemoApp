import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/entity/memo.dart';
import 'package:handwrite_memo_app/model/memo_model.dart';
import 'package:provider/provider.dart';

class PreviewScreen extends StatelessWidget {
  final memo;

  PreviewScreen({Key key, @required this.memo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MemoModel>(context, listen: true);

    void _deleteMemo(Memo memo) {
      model.remove(memo);
      Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
    }

    Future<void> _deleteMemoDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('Can you delete this memo?'),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text("Delete"),
                isDestructiveAction: true,
                onPressed: () => _deleteMemo(memo),
              ),
              CupertinoDialogAction(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        },
      );
    }

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: convertDateTimeToDate(memo.createdAt),
          backgroundColor: memo.isPositive ? Colors.blue : Colors.red,
          actions: [
            IconButton(
                icon: Icon(Icons.delete_forever),
                onPressed: () {
                  _deleteMemoDialog();
                }),
          ],
        ),
        body: Image.file(File("${memo.path}")),
      ),
    );
  }

  Text convertDateTimeToDate(DateTime createdAt) {
    if (createdAt.year == DateTime.now().year) {
      return Text(
          "${createdAt.month}月${createdAt.day}日  ${createdAt.hour}:${createdAt.minute}");
    } else {
      return Text(
          "${createdAt.year}年${createdAt.month}月${createdAt.day}日  ${createdAt.hour}:${createdAt.minute}");
    }
  }
}
