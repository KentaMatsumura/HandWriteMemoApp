import 'package:handwrite_memo_app/dao/memo_dao.dart';
import 'package:handwrite_memo_app/entity/memo.dart';

class CreateMemoRepository {
  final createMemoDao = CreateMemoDao();

  Future getAllCreateMemo() => createMemoDao.getAll();

  Future insertCreateMemo(Memo createMemo) => createMemoDao.create(createMemo);

  Future updateCreateMemo(Memo createMemo) => createMemoDao.update(createMemo);

  Future deleteCreateMemoById(int id) => createMemoDao.delete(id);
}
