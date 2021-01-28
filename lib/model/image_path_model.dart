import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/entity/image_path.dart';
import 'package:handwrite_memo_app/repository/image_path_repository.dart';

class ImagePathModel with ChangeNotifier {
  List<ImagePath> _allImageList = [];

  List<ImagePath> get allImageList => _allImageList;

  final ImagePathRepository repo = ImagePathRepository();

  ImagePathModel() {
    _fetchAll();
  }

  void _fetchAll() async {
    _allImageList = await repo.getAllImagePath();
    debugPrint("$allImageList");
    notifyListeners();
  }

  void fetch() {
    _fetchAll();
  }
}
