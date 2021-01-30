import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/entity/memo.dart';
import 'package:handwrite_memo_app/model/memo_model.dart';
import 'package:provider/provider.dart';

class ListMemoTile extends StatelessWidget {
  final Memo memo;

  const ListMemoTile({Key key, @required this.memo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    debugPrint("in ListTile: ${memo.path}");

    return Center(
      child: Card(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: _CheckBoxButton(memo: memo),
              color: Colors.green,
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(2),
              width: size.width * 0.1,
              height: size.height * 0.1,
            ),
            Container(
              child: GestureDetector(
                child: Image.file(
                  File("${memo.path}"),
                  fit: BoxFit.fitWidth,
                ),
                onTap: (){
                  // Previewを表示する
                  debugPrint("tapped");
                },
              ),
              color: Colors.blue,
              width: size.width * 0.7,
              height: size.height * 0.1,
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(0),
            ),
            Container(
              child: _RemoveButton(memo: memo),
              color: Colors.red,
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(2),
              width: size.width * 0.1,
              height: size.height * 0.1,
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

class MemoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Icon(Icons.check_box),
              color: Colors.green,
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(2),
            ),
            Container(
              child: Icon(Icons.check_box),
              color: Colors.blue,
              width: 200,
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(0),
            ),
            Container(
              child: Icon(Icons.check_box),
              color: Colors.red,
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(2),
            ),
          ],
        ),
      ),
    );
  }
}

//
// class MemoTile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         leading: _CheckBoxButton(memo: memo),
//         // title: Image.file(imagePath),
//         title: Text(memo.fileName),
//         tileColor: memo.isPositive ? Colors.blue : Colors.red,
//         trailing: _RemoveButton(memo: memo),
//         onTap: () {
//           debugPrint("${memo.fileName}");
//         },
//       ),
//     );
//
//   }
// }
