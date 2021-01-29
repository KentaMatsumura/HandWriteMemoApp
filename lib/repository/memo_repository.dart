import 'package:handwrite_memo_app/dao/memo_dao.dart';
import 'package:handwrite_memo_app/entity/memo.dart';

class MemoRepository {
  final memoDao = MemoDao();

  Future getAllMemo() => memoDao.getAll();

  Future insertMemo(Memo memo) => memoDao.create(memo);

  Future updateMemo(Memo memo) => memoDao.update(memo);

  Future deleteMemoById(int id, String path) => memoDao.delete(id, path);
}
