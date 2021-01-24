import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/model/pen_model.dart';
import 'package:provider/provider.dart';

class Palette extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pen = Provider.of<PenModel>(context);
    return Container(
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.circle),
              iconSize: 40,
              padding: EdgeInsets.all(0.0),
              splashRadius: 25,
              color: Colors.black,
              onPressed: () {
                pen.color = Colors.black;
              },
            ),
            IconButton(
              icon: Icon(Icons.circle),
              iconSize: 40,
              padding: EdgeInsets.all(0.0),
              splashRadius: 25,
              color: Colors.red,
              onPressed: () {
                pen.color = Colors.red;
              },
            ),
            IconButton(
              icon: Icon(Icons.circle),
              iconSize: 40,
              padding: EdgeInsets.all(0.0),
              splashRadius: 25,
              color: Colors.blue,
              onPressed: () {
                pen.color = Colors.blue;
              },
            ),
          ],
        ),
      ),
    );
  }
}
