import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/model/strokes_model.dart';
import 'package:provider/provider.dart';

class Paper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strokes = Provider.of<StrokesModel>(context);

    return Listener(
      onPointerDown: (details) {
        strokes.add(details.localPosition);
        // debugPrint('${details.position}');
      },
      onPointerMove: (details) {
        strokes.update(details.localPosition);
      },
      onPointerUp: (details) {
        strokes.update(details.localPosition);
      },
      child: CustomPaint(
        painter: _Painter(strokes: strokes),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
        ),
      ),
    );

    // return GestureDetector(
    //   onPanStart: (start) {
    //     strokes.add(start.localPosition);
    //     debugPrint('${start.localPosition}');
    //   },
    //   onPanUpdate: (update) {
    //     strokes.update(update.localPosition);
    //   },
    //   // onPanEnd: ,
    //   child: CustomPaint(
    //     painter: _Painter(strokes: strokes),
    //     // child: ConstrainedBox(
    //     //   constraints: BoxConstraints.expand(),
    //     // ),
    //   ),
    // );
  }
}

class _Painter extends CustomPainter {
  final StrokesModel strokes;

  _Painter({this.strokes});

  @override
  void paint(Canvas canvas, Size size) {
    strokes.all.forEach((stroke) {
      final paint = Paint()
        ..color = Colors.black
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 3;
      canvas.drawPoints(PointMode.polygon, stroke.points, paint);
    });
  }

  @override
  bool shouldRepaint(_Painter oldDelegate) {
    return true;
  }
}
