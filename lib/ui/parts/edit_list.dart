import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/model/strokes_model.dart';
import 'package:provider/provider.dart';

class EditList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strokes = Provider.of<StrokesModel>(context);

    return Container(
      child: Align(
        alignment: Alignment.bottomRight,
        child: Row(
          children: [
            IconButton(
                icon: Icon(Icons.subdirectory_arrow_left_outlined),
                iconSize: 40,
                onPressed: () async {
                  strokes.undo();
                }),
            IconButton(
                icon: Icon(Icons.delete),
                iconSize: 40,
                onPressed: () async {
                  strokes.clear();
                }),
            IconButton(
                icon: Icon(Icons.subdirectory_arrow_right_outlined),
                iconSize: 40,
                onPressed: () async {
                  strokes.redo();
                }),
          ],
        ),
      ),
    );
  }
}
