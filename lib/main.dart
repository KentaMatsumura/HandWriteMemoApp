import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/model/list_memo_model.dart';
import 'package:handwrite_memo_app/ui/main_button_navigation.dart';
import 'package:provider/provider.dart';

import 'model/button_navigation_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ButtomNavigationModel>(
          create: (context) => ButtomNavigationModel(),
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
        home: MainButtonNavigation(),
      ),
    );
  }
}
