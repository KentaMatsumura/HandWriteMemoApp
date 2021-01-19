import 'package:handwrite_memo_app/entity/list_memo.dart';
import 'package:handwrite_memo_app/service/database.dart';

class ListMemoDao{
  final dbProvider = DatabaseService.dbProvider;
  final tableName = DatabaseService.memoTableName;

  Future<int> create(ListMemo listMemo) async {
    final db = await dbProvider.database;
    var result = db.insert(tableName, listMemo.toDatabaseJson());
    return result;
  }

  Future<List<ListMemo>> getAll() async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> result = await db.query(tableName);
    List<ListMemo> listMemo = result.isNotEmpty
        ? result.map((item) => ListMemo.fromDatabaseJson(item)).toList()
        : [];
    return listMemo;
  }

  Future<int> update(ListMemo listMemo) async {
    final db = await dbProvider.database;
    var result = await db.update(tableName, listMemo.toDatabaseJson(),
        where: "id = ?", whereArgs: [listMemo.id]);
    return result;
  }

  Future<int> delete(int id) async {
    final db = await dbProvider.database;
    var result = await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
    return result;
  }
}
