import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/entity/memo.dart';
import 'package:handwrite_memo_app/repository/create_memo_repository.dart';

class CreateMemoModel with ChangeNotifier {
  List<Memo> _allCreateMemo = [];

  List<Memo> get allListMemo => _allCreateMemo;

  final CreateMemoRepository repo = CreateMemoRepository();

  CreateMemoModel() {
    _fetchAll();
  }

  void _fetchAll() async {
    _allCreateMemo = await repo.getAllCreateMemo();
    notifyListeners();
  }


  void add(Memo memo) async {
    await repo.insertCreateMemo(memo);
    _fetchAll();
  }

  void update(Memo memo) async {
    await repo.updateCreateMemo(memo);
    _fetchAll();
  }

  void toggleIsDone(Memo memo) async {
    memo.isSelected = !memo.isSelected;
    update(memo);
  }

  void remove(Memo memo) async {
    await repo.deleteCreateMemoById(memo.id);
    _fetchAll();
  }
}
