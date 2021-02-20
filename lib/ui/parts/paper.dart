import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/model/pen_model.dart';
import 'package:handwrite_memo_app/model/strokes_model.dart';
import 'package:provider/provider.dart';

class Paper extends StatelessWidget {
  final isPositive;

  Paper({Key key, @required this.isPositive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pen = Provider.of<PenModel>(context);
    final strokes = Provider.of<StrokesModel>(context);
    final Size size = MediaQuery.of(context).size;

    TextStyle style() {
      return TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
      );
    }

    return Stack(
      children: [
        Container(
          color: Colors.white, // 背景を白色に
          child: Listener(
            onPointerDown: (details) {
              strokes.add(pen, details.localPosition);
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
          ),
        ),
        Container(
          height: size.height * 0.65,
          width: size.width * 0.8,
          padding: EdgeInsets.only(left: size.width * 0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("タイトル", style: style()),
              isPositive
                  ? Text("要因・なんで？", style: style())
                  : Text("原因・なんで？", style: style()),
              isPositive
                  ? Text("気付き", style: style())
                  : Text("対策・どうする？", style: style()),
              Text("これからやるべきこと", style: style()),
              // Text("備考", style: style()),
            ],
          ),
        ),
      ],
    );
  }
}

class _Painter extends CustomPainter {
  final StrokesModel strokes;

  _Painter({this.strokes});

  @override
  void paint(Canvas canvas, Size size) {
    strokes.all.forEach((stroke) {
      final paint = Paint()
        ..color = stroke.color
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
