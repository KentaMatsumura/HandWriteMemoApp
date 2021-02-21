import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/entity/memo.dart';
import 'package:handwrite_memo_app/model/memo_model.dart';
import 'package:handwrite_memo_app/ui/preview_screen.dart';
import 'package:provider/provider.dart';

class ListMemoTile extends StatelessWidget {
  final Memo memo;

  const ListMemoTile({Key key, @required this.memo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // debugPrint("in ListTile: ${memo.path}");

    return Center(
      child: Card(
        color: this.memo.isPositive ? Colors.blue : Colors.red,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: _CheckBoxButton(memo: memo),
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(2),
              width: size.width * 0.1,
              height: size.height * 0.15,
            ),
            Container(
              child: _MemoPreview(
                memo: memo,
              ),
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(0),
              width: size.width * 0.7,
              height: size.height * 0.15,
            ),
            Container(
              child: _RemoveButton(memo: memo),
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(2),
              width: size.width * 0.1,
              height: size.height * 0.15,
            ),
          ],
        ),
      ),
    );
  }
}

class _CheckBoxButton extends StatelessWidget {
  final Memo memo;

  const _CheckBoxButton({
    Key key,
    @required this.memo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MemoModel>(context, listen: true);
    return FlatButton(
      child: Container(
        child: memo.isSelected
            ? Icon(Icons.check_box)
            : Icon(Icons.check_box_outline_blank),
      ),
      padding: EdgeInsets.all(0),
      // margin: EdgeInsets.all(0),
      minWidth: 0,
      onPressed: () {
        model.toggleIsDone(memo);
      },
    );
  }
}

class _RemoveButton extends StatelessWidget {
  final Memo memo;

  const _RemoveButton({
    Key key,
    @required this.memo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MemoModel>(context, listen: true);
    return FlatButton(
      child: Icon(Icons.delete_forever),
      onPressed: () {
        model.remove(memo);
      },
      minWidth: 0,
      padding: EdgeInsets.all(0),
    );
  }
}

class _MemoPreview extends StatelessWidget {
  final Memo memo;

  const _MemoPreview({
    Key key,
    @required this.memo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: GestureDetector(
        child: ClipRect(
          child: Align(
            alignment: Alignment.topCenter,
            heightFactor: 0.23,
            child: Image.file(
              File("${memo.path}"),
            ),
          ),
        ),
        onTap: () async {
          // Previewを表示する
          debugPrint("tapped ${memo.fileName}");
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PreviewScreen(
                        memo: memo,
                      )));
        },
      ),
    );
  }
}
