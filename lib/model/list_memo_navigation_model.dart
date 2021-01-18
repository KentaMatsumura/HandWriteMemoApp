import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/ui/list_memo_screen.dart';

class ListMemoNavigationModel with ChangeNotifier {
  final List<Widget> options = [
    ListMemoScreen(),
  ];

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void change(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Widget getSelectedScreen() {
    return options[selectedIndex];
  }
}
