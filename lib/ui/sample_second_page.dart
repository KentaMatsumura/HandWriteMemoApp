import 'package:flutter/material.dart';

class SampleSecondPage extends StatelessWidget {
  SampleSecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('second page'),),
      body: Center(
        child: Text('hello'),
      ),
    );
  }
}
