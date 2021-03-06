import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/entity/list_memo.dart';

import 'list_memo_tile.dart';

class ListMemoView extends StatelessWidget {
  final List<ListMemo> list;

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
        return ListMemoTile(listMemo: listMemo);
      },
      itemCount: list.length,
    );
  }
}
