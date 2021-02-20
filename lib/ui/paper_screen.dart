import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/model/image_model.dart';
import 'package:handwrite_memo_app/model/pen_model.dart';
import 'package:handwrite_memo_app/model/strokes_model.dart';
import 'package:handwrite_memo_app/ui/parts/editor.dart';
import 'package:handwrite_memo_app/ui/parts/palette.dart';
import 'package:handwrite_memo_app/ui/parts/paper.dart';
import 'package:handwrite_memo_app/ui/parts/widget_to_image.dart';
import 'package:provider/provider.dart';

class PaperScreen extends StatelessWidget {
  final isPositive;

  PaperScreen({Key key, @required this.isPositive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final strokes = Provider.of<StrokesModel>(context);
    final pen = Provider.of<PenModel>(context);
    final pageKey = Provider.of<ImageModel>(context);
    final Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        WidgetToImage(builder: (key) {
          pageKey.key = key;
          return Paper(
            isPositive: isPositive,
          );
        }),
        Container(
          height: size.height * 0.90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Palette(),
              Editor(),
            ],
          ),
        )
      ],
    );
  }
}
