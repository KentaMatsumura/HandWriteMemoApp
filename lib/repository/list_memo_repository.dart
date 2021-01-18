import 'package:handwrite_memo_app/dao/list_memo_dao.dart';
import 'package:handwrite_memo_app/entity/list_memo.dart';

class ListMemoRepository {
  final listMemoDao = ListMemoDao();

  Future getAllListMemo() => listMemoDao.getAll();

  Future insertListMemo(ListMemo listMemo) => listMemoDao.create(listMemo);

  Future updateListMemo(ListMemo listMemo) => listMemoDao.update(listMemo);

  Future deleteListMemoById(int id) => listMemoDao.delete(id);
}
