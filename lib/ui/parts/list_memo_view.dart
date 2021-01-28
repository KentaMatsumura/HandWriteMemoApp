import 'dart:io';

import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/entity/image_path.dart';

// import 'package:handwrite_memo_app/entity/list_memo.dart';
import 'package:handwrite_memo_app/entity/memo.dart';

import 'list_memo_tile.dart';

class ListMemoView extends StatelessWidget {
  final List<Memo> list;
  final List<ImagePath> images;

  const ListMemoView({Key key, @required this.list, @required this.images})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      return Center(
        child: Text('No Items'),
      );
    }
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        var listMemo = list[index];
        var listImagePath = images
            .map((image) {
              if (image.path.toString().contains(listMemo.fileName)) {
                return image.path;
              }
            })
            .toList()
            .where((path) => path != null)
            .toList();

        debugPrint("memo: ${listMemo.fileName}");
        debugPrint("listImagePath: ${listImagePath[0]}");
        debugPrint("");
        return ListMemoTile(memo: listMemo, imagePath: listImagePath[0],);
      },
      itemCount: list.length,
    );
  }
}
