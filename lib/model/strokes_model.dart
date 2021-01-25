import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/model/pen_model.dart';

class StrokesModel with ChangeNotifier {
  List<Stroke> _drawList = [];
  List<Stroke> _undoList = [];

  get all => _drawList;

  List<Stroke> get drawList => _drawList;

  void add(PenModel pen, Offset offset) {
    _drawList.add(Stroke(pen.color)..add(offset));
    notifyListeners();
  }

  void update(Offset offset) {
    _drawList.last.add(offset);
    if(_undoList.isNotEmpty){
      _undoList = [];
    }
    notifyListeners();
  }

  void undo() {
    if (_drawList.isNotEmpty) {
      _undoList.add(_drawList.removeLast());
    }
    notifyListeners();
  }

  void redo() {
    if (_undoList.isNotEmpty) {
      _drawList.add(_undoList.removeLast());
    }
    notifyListeners();
  }

  void clear() {
    _drawList = [];
    _undoList = [];
    notifyListeners();
  }
}

class Stroke {
  final List<Offset> points = [];
  final Color color;

  Stroke(this.color);

  add(Offset offset) {
    points.add(offset);
  }
}
