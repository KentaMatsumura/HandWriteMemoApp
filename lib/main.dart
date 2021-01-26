import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/model/image_model.dart';
import 'package:handwrite_memo_app/model/memo_model.dart';
import 'package:handwrite_memo_app/model/create_memo_navigation_model.dart';
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
        ChangeNotifierProvider<CreateMemoNavigationModel>(
            create: (context) => CreateMemoNavigationModel()),
        ChangeNotifierProvider<StrokesModel>(
          create: (context) => StrokesModel(),
        ),
        ChangeNotifierProvider<PenModel>(
          create: (context) => PenModel(),
        ),
        ChangeNotifierProvider<ImageModel>(
          create: (context) => ImageModel(),
        )
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
