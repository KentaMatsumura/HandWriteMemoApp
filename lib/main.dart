import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/model/list_memo_model.dart';
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
        ChangeNotifierProvider<ListMemoModel>(
          create: (context) => ListMemoModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Todo App Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainListMemoNavigation(),
      ),
    );
  }
}
