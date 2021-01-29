import 'dart:io';

import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/entity/memo.dart';
import 'package:handwrite_memo_app/service/database.dart';
import 'package:path_provider/path_provider.dart';

class MemoDao {
  // DB Providerの呼び出し
  final dbProvider = DatabaseService.dbProvider;
  final tableName = DatabaseService.memoTableName;

  // 新規作成
  Future<int> create(Memo memo) async {
    final db = await dbProvider.database;
    final String dir = (await getApplicationDocumentsDirectory()).path;

    var result = db.insert(tableName, memo.toDatabaseJson());
    return result;
  }

  // 全て取得
  Future<List<Memo>> getAll() async {
    final db = await dbProvider.database;
    final String dir = (await getApplicationDocumentsDirectory()).path;
    List<Map<String, dynamic>> result = await db.query(tableName);
    List<Memo> memo = result.isNotEmpty
        ? result.map((item) => Memo.fromDatabaseJson(item, dir)).toList()
        : [];
    return memo;
  }

  // 更新
  // 使ってない
  Future<int> update(Memo memo) async {
    final db = await dbProvider.database;
    var result = await db.update(tableName, memo.toDatabaseJson(),
        where: "id = ?", whereArgs: [memo.id]);
    return result;
  }

  // 削除
  Future<int> delete(int id, String path) async {
    final db = await dbProvider.database;
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final fullPath = Directory("$path");
    debugPrint("delete:::$path");
    fullPath.deleteSync(recursive: true);
    var result = await db.delete(tableName, where: 'id = ?', whereArgs: [id]);

    return result;
  }
}
