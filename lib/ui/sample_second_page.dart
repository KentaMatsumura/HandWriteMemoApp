import 'package:flutter/material.dart';

class SampleSecondPage extends StatelessWidget {
  final receive;
  SampleSecondPage({Key key, @required this.receive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (receive[1]){
      return Scaffold(
        appBar: AppBar(title: Text('${receive[0]}'),),
        backgroundColor: Colors.red,
        body: Center(
          child: Text('hello'),
        ),
      );
    }
    else{
      return Scaffold(
        appBar: AppBar(title: Text('${receive[0]}'),),
        backgroundColor: Colors.blue,
        body: Center(
          child: Text('hello'),
        ),
      );
    }

  }
}
