import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/entity/list_memo.dart';
import 'package:handwrite_memo_app/entity/memo.dart';

import 'list_memo_tile.dart';

class ListMemoView extends StatelessWidget {
  final List<Memo> list;

  const ListMemoView({Key key, @required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      return Center(
        child: Text('No Items'),
      );
    }
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        var listMemo = list[index];
        return ListMemoTile(memo: listMemo);
      },
      itemCount: list.length,
    );
  }
}
