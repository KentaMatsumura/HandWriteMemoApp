import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/model/image_path_model.dart';
import 'package:handwrite_memo_app/model/image_model.dart';
import 'package:handwrite_memo_app/model/image_name_model.dart';
import 'package:handwrite_memo_app/model/memo_model.dart';
import 'package:handwrite_memo_app/model/pen_model.dart';
import 'package:handwrite_memo_app/model/strokes_model.dart';

import 'package:handwrite_memo_app/ui/main_list_memo_navigation.dart';
import 'package:provider/provider.dart';

import 'model/list_memo_navigation_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ListMemoNavigationModel>(
          create: (context) => ListMemoNavigationModel(),
        ),
        ChangeNotifierProvider<MemoModel>(create: (context) => MemoModel()),
        ChangeNotifierProvider<StrokesModel>(
          create: (context) => StrokesModel(),
        ),
        ChangeNotifierProvider<PenModel>(
          create: (context) => PenModel(),
        ),
        ChangeNotifierProvider<ImageModel>(
          create: (context) => ImageModel(),
        ),
        ChangeNotifierProvider<ImageNameModel>(
          create: (context) => ImageNameModel(),
        ),
        ChangeNotifierProvider<ImagePathModel>(
          create: (context) => ImagePathModel(),
        ),
      ],
      child: MaterialApp(
        title: 'メモ！！！',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainListMemoNavigation(),
      ),
    );
  }
}

/**
 * 画像参照用
 * /Users/kentamatsumura/Library/Developer/CoreSimulator/Devices/098799A4-85BE-4793-B4A1-F2F9221FA748/data/Containers/Data/Application/C7356969-18F1-4D8E-AB77-3E048F9DF845/Documents/
 */
