import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/entity/list_memo.dart';
import 'package:handwrite_memo_app/repository/list_memo_repository.dart';

class ListMemoModel with ChangeNotifier {
  List<ListMemo> _allListMemo = [];

  List<ListMemo> get allListMemo => _allListMemo;

  final ListMemoRepository repo = ListMemoRepository();

  ListMemoModel() {
    _fetchAll();
  }

  void _fetchAll() async {
    _allListMemo = await repo.getAllListMemo();
    notifyListeners();
  }

  void add(ListMemo listMemo) async {
    await repo.insertListMemo(listMemo);
    _fetchAll();
  }

  void update(ListMemo listMemo) async {
    await repo.updateListMemo(listMemo);
    _fetchAll();
  }

  void toggleIsDone(ListMemo listMemo) async {
    listMemo.isSelected = !listMemo.isSelected;
    update(listMemo);
  }

  void remove(ListMemo listMemo) async {
    await repo.deleteListMemoById(listMemo.id);
    _fetchAll();
  }
}
