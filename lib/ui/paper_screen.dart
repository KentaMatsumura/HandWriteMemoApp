import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/model/strokes_model.dart';
import 'package:handwrite_memo_app/ui/parts/paper.dart';
import 'package:provider/provider.dart';

class PaperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strokes = Provider.of<StrokesModel>(context);

    return SafeArea(child: Paper());
  }
}
