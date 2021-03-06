import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/model/list_memo_model.dart';
import 'package:handwrite_memo_app/ui/parts/list_memo_view.dart';
import 'package:provider/provider.dart';

class ListMemoScreen extends StatelessWidget {
  ListMemoScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ListMemoModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(title: Text('メモ')),
      body: ListMemoView(list: model.allListMemo),
    );
  }
}
