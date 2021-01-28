import 'dart:io';

import 'package:flutter/material.dart';

class ImagePath {
  final File path;

  ImagePath({this.path});

  factory ImagePath.fromDevice(FileSystemEntity data) {
    if (data.path.contains("AppName")){
      return ImagePath(path: File(data.path));
    }else{
      return null;
    }
  }
}
