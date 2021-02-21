import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ItemPositionModel with ChangeNotifier {
  ItemScrollController _itemScrollController = ItemScrollController();
  ItemPositionsListener _itemPositionsListener = ItemPositionsListener.create();
  int _latestIndex;

  get itemScrollController => _itemScrollController;
  get itemPositionsListener => _itemPositionsListener;
  get latestIndex => _latestIndex;

  void setLatestIndex(int index){
    _latestIndex = index;
    // notifyListeners();
  }

  void itemPositionsCallback() {
    // 表示中のリストアイテムのインデックス情報を取得
    final visibleIndexes = itemPositionsListener.itemPositions.value
        .toList()
        .map((itemPosition) => itemPosition.index);
    print('現在表示中アイテムのindexは $visibleIndexes');
  }

  void jumpToLatest(){
    _itemScrollController.jumpTo(index: latestIndex);
  }

  void addListIndex(){
    _latestIndex += 1;
    notifyListeners();
  }
}
