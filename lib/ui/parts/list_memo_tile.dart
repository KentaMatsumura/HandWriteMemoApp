import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/entity/memo.dart';
import 'package:handwrite_memo_app/model/memo_model.dart';
import 'package:provider/provider.dart';

class ListMemoTile extends StatelessWidget {
  final Memo memo;
  const ListMemoTile({
    Key key,
    @required this.memo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = memo.isPositive ? Colors.blue : Colors.red;
    return Card(
      child: ListTile(
        leading: _CheckBoxButton(memo: memo),
        title: Text(memo.text),
        tileColor: color,
        trailing: _RemoveButton(memo: memo),
      ),
    );
  }
}

class _CheckBoxButton extends StatelessWidget {
  final Memo memo;

  const _CheckBoxButton({
    Key key,
    @required this.memo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MemoModel>(context, listen: true);
    return FlatButton(
      child: memo.isSelected
          ? Icon(Icons.check_box)
          : Icon(Icons.check_box_outline_blank),
      onPressed: () {
        model.toggleIsDone(memo);
      },
    );
  }
}

class _RemoveButton extends StatelessWidget {
  final Memo memo;

  const _RemoveButton({
    Key key,
    @required this.memo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MemoModel>(context, listen: true);
    return FlatButton(
      child: Icon(Icons.delete_forever),
      onPressed: () {
        model.remove(memo);
      },
    );
  }
}
