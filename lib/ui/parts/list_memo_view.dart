import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/entity/memo.dart';
import 'package:handwrite_memo_app/model/item_position_model.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'list_memo_tile.dart';

class ListMemoView extends StatelessWidget {
  final List<Memo> list;

  const ListMemoView({Key key, @required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemPositionModel =
        Provider.of<ItemPositionModel>(context, listen: true);
    itemPositionModel.setLatestIndex(list.length);

    if (list.isEmpty) {
      return Center(
        child: Text('No Items'),
      );
    }

    return ScrollablePositionedList.builder(
      itemBuilder: (BuildContext context, int index) {
        var listMemo = list[index];
        // debugPrint("in ListView: ${list.length}");
        // debugPrint("=====================");
        return ListMemoTile(
          memo: listMemo,
        );
      },
      itemCount: list.length,
      itemScrollController: itemPositionModel.itemScrollController,
      itemPositionsListener: itemPositionModel.itemPositionsListener,
      initialScrollIndex: itemPositionModel.latestIndex,
    );
  }
}
