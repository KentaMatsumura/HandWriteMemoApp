import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/model/pen_model.dart';
import 'package:handwrite_memo_app/model/strokes_model.dart';
import 'package:handwrite_memo_app/ui/parts/edit_list.dart';
import 'package:handwrite_memo_app/ui/parts/palette.dart';
import 'package:handwrite_memo_app/ui/parts/paper.dart';
import 'package:provider/provider.dart';

class PaperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strokes = Provider.of<StrokesModel>(context);
    final pen = Provider.of<PenModel>(context);
    final Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Paper(),
        Container(
          height: size.height * 0.85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Palette(),
              EditList(),
            ],
          ),
        )
      ],
    );
  }
}
