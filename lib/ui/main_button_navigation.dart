import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/entity/list_memo.dart';
import 'package:handwrite_memo_app/model/button_navigation_model.dart';
import 'package:handwrite_memo_app/model/list_memo_model.dart';
import 'package:provider/provider.dart';

class MainButtonNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final buttonNavigationModel =
        Provider.of<ButtomNavigationModel>(context, listen: true);
    return Scaffold(
      body: Center(
        child: buttonNavigationModel.getSelectedScreen(),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       title: Text('All'),
      //     ),
      //   ],
      //   type: BottomNavigationBarType.fixed,
      //   currentIndex: buttonNavigationModel.selectedIndex,
      //   selectedItemColor: Colors.amber[800],
      //   onTap: (index) {
      //     buttonNavigationModel.change(index);
      //   },
      // ),
      floatingActionButton: AddMemoButton(),
    );
  }
}

class AddMemoButton extends StatelessWidget {
  const AddMemoButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // ここで画面遷移したい
      child: Icon(Icons.add),
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              // return AddMemoDialog();
              return PopupFloatButton();
            });
      },
    );
  }
}

class PopupFloatButton extends StatelessWidget {
  PopupFloatButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      backgroundColor: Colors.grey.withOpacity(0.1),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          // positive
          FloatingActionButton(
            heroTag: "P",
            onPressed: () {
              // if (_controller.canUndo) _controller.undo();
              debugPrint("=========Positive");
              Navigator.pop(context);
            },
            child: Text("P"),
          ),

          SizedBox(
            height: 20.0,
          ),

          // negative
          FloatingActionButton(
            heroTag: "N",
            backgroundColor: Colors.red,
            onPressed: () {
              // if (_controller.canRedo) _controller.redo();
              debugPrint("=========Negative");
              Navigator.pop(context);
            },
            child: Text("N"),
          ),

          SizedBox(
            height: 20.0,
          ),

          // cancel
          FloatingActionButton(
            heroTag: "x",
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            // onPressed: () => _controller.clear(),
            onPressed: () {
              // if (_controller.canRedo) _controller.redo();
              debugPrint("=========Cancel");
              Navigator.pop(context);
            },
            child: Text("X"),
          ),
        ],
      ),
    );
  }
}

class AddMemoDialog extends StatelessWidget {
  AddMemoDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ListMemoModel>(context, listen: true);
    final titleTextEditingController = TextEditingController();
    return SimpleDialog(
      title: Text("Add Todo"),
      contentPadding: EdgeInsets.all(16),
      children: <Widget>[
        TextField(
          controller: titleTextEditingController,
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: "Write todo..."),
        ),
        FlatButton(
          child: Text('Add'),
          color: Colors.blue,
          onPressed: () {
            model.add(ListMemo(title: titleTextEditingController.text));
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
