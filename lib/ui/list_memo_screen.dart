import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/model/image_path_model.dart';
import 'package:handwrite_memo_app/model/memo_model.dart';
import 'package:handwrite_memo_app/ui/parts/list_memo_view.dart';
import 'package:provider/provider.dart';

class ListMemoScreen extends StatelessWidget {
  ListMemoScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MemoModel>(context, listen: true);
    final imagePath = Provider.of<ImagePathModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(title: Text('メモ')),
      body: ListMemoView(list: model.allListMemo, images: imagePath.allImageList,),
    );
  }
}
