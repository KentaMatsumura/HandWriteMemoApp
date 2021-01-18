import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/entity/list_memo.dart';
import 'package:handwrite_memo_app/model/list_memo_model.dart';
import 'package:provider/provider.dart';

class ListMemoTile extends StatelessWidget {
  final ListMemo listMemo;

  const ListMemoTile({
    Key key,
    @required this.listMemo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: _CheckBoxButton(listMemo: listMemo),
        title: Text(listMemo.title),
        trailing: _RemoveButton(listMemo: listMemo),
      ),
    );
  }
}

class _CheckBoxButton extends StatelessWidget {
  final ListMemo listMemo;

  const _CheckBoxButton({
    Key key,
    @required this.listMemo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ListMemoModel>(context, listen: true);
    return FlatButton(
      child: listMemo.isSelected
          ? Icon(Icons.check_box)
          : Icon(Icons.check_box_outline_blank),
      onPressed: () {
        model.toggleIsDone(listMemo);
      },
    );
  }
}

class _RemoveButton extends StatelessWidget {
  final ListMemo listMemo;

  const _RemoveButton({
    Key key,
    @required this.listMemo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ListMemoModel>(context, listen: true);
    return FlatButton(
      child: Icon(Icons.delete_forever),
      onPressed: () {
        model.remove(listMemo);
      },
    );
  }
}
