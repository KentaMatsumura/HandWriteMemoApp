import 'package:flutter/material.dart';

class ScrollPositionModel with ChangeNotifier {
  int _index = 0;
  double _leadingEdge = 0.0;

  get index => _index;

  get leadingEdge => _leadingEdge;

  set index(int index) {
    _index = index;
    notifyListeners();
  }

  set leadingEdge(double leadingEdge){
    _leadingEdge = leadingEdge;
    notifyListeners();
  }
}
