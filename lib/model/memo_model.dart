import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/entity/memo.dart';
import 'package:handwrite_memo_app/repository/memo_repository.dart';

class MemoModel with ChangeNotifier {
  List<Memo> _allMemo = [];

  List<Memo> get allListMemo => _allMemo;

  final MemoRepository repo = MemoRepository();

  MemoModel() {
    _fetchAll();
  }

  void _fetchAll() async {
    _allMemo = await repo.getAllMemo();
    notifyListeners();
  }


  void add(Memo memo) async {
    await repo.insertMemo(memo);
    _fetchAll();
  }

  void update(Memo memo) async {
    await repo.updateMemo(memo);
    _fetchAll();
  }

  void toggleIsDone(Memo memo) async {
    memo.isSelected = !memo.isSelected;
    update(memo);
  }

  void remove(Memo memo) async {
    await repo.deleteMemoById(memo.id);
    _fetchAll();
  }
}
