import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/entity/memo.dart';
import 'package:handwrite_memo_app/service/database.dart';

class MemoDao {
  // DB Providerの呼び出し
  final dbProvider = DatabaseService.dbProvider;
  final tableName = DatabaseService.memoTableName;

  // 新規作成
  Future<int> create(Memo  memo) async {
    final db = await dbProvider.database;
    var result = db.insert(tableName,  memo.toDatabaseJson());
    return result;
  }

  // 全て取得
  // ここでは多分作成のみなので使わない/ 使わなかったら削除
  Future<List<Memo>> getAll() async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> result = await db.query(tableName);
    List<Memo>  memo = result.isNotEmpty
        ? result.map((item) => Memo.fromDatabaseJson(item)).toList()
        : [];
    return  memo;
  }

  // 更新
  // 更新も使わないと思うので使わなかったら削除
  Future<int> update(Memo  memo) async {
    final db = await dbProvider.database;
    var result = await db.update(tableName,  memo.toDatabaseJson(),
        where: "id = ?", whereArgs: [ memo.id]);
    return result;
  }

  // 削除
  // ここでは使わないと思うので使わなかったら削除
  Future<int> delete(int id) async {
    final db = await dbProvider.database;
    var result = await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
    return result;
  }
}
