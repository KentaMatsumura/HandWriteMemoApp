import 'package:flutter/material.dart';

// import 'package:handwrite_memo_app/entity/list_memo.dart';
import 'package:handwrite_memo_app/entity/memo.dart';
import 'package:handwrite_memo_app/model/memo_model.dart';
import 'package:handwrite_memo_app/model/list_memo_navigation_model.dart';
import 'package:handwrite_memo_app/model/pen_model.dart';
import 'package:handwrite_memo_app/model/strokes_model.dart';

// import 'package:handwrite_memo_app/model/list_memo_model.dart';
import 'package:handwrite_memo_app/ui/create_memo_navigation.dart';
import 'package:provider/provider.dart';

class MainListMemoNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listMemoNavigationModel =
        Provider.of<ListMemoNavigationModel>(context, listen: true);
    return Scaffold(
      body: Center(
        child: listMemoNavigationModel.getSelectedScreen(),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       title: Text('All'),
      //     ),
      //   ],
      //   type: BottomNavigationBarType.fixed,
      //   currentIndex: listMemoNavigationModel.selectedIndex,
      //   selectedItemColor: Colors.amber[800],
      //   onTap: (index) {
      //     listMemoNavigationModel.change(index);
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
    final strokes = Provider.of<StrokesModel>(context);
    final pen = Provider.of<PenModel>(context);

    return Scaffold(
      body: Container(),
      backgroundColor: Colors.grey.withOpacity(0.1),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          // positive
          FloatingActionButton(
            heroTag: "P",
            onPressed: () async {
              strokes.clear();
              pen.resetColor();
              debugPrint("=========Positive");
              Navigator.pop(context); // PopupFloatButtonを閉じる
              await Navigator.push(
                  // 画面遷移
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateMemoNavigation(
                      receive: ['positive', true],
                    ),
                  ));
            },
            child: Text("P"),
          ),

          SizedBox(
            height: 5.0,
          ),

          // negative
          FloatingActionButton(
            heroTag: "N",
            backgroundColor: Colors.red,
            onPressed: () async {
              strokes.clear();
              pen.resetColor();
              debugPrint("=========Negative");
              Navigator.pop(context);
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateMemoNavigation(
                      receive: ['negative', false],
                    ),
                  ));
            },
            child: Text("N"),
          ),

          SizedBox(
            height: 5.0,
          ),

          // cancel
          FloatingActionButton(
            heroTag: "x",
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            onPressed: () {
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


// 使ってない
class AddMemoDialog extends StatelessWidget {
  AddMemoDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MemoModel>(context, listen: true);
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
            model.add(Memo(
                fileName: titleTextEditingController.text,
                createdAt: DateTime.now(),
                isPositive: true));
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
