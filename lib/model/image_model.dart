import 'dart:typed_data';

import 'package:flutter/material.dart';


class ImageModel with ChangeNotifier {
  GlobalKey key;
  Uint8List pngByte;
}
