import 'dart:io';

import 'package:flutter/material.dart';

class ImageNameModel with ChangeNotifier{
  File _image;

  get image => _image;

  void updateImageFilePath(File image){
    this._image = image;
    notifyListeners();
  }
}
