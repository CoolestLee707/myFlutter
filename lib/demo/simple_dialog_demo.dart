import 'package:flutter/material.dart';
import 'dart:async';

enum Option { A, B, C }

class SimpleDialogDemo extends StatefulWidget {
  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  String _choice = 'Nothing';

//弹出对话框（提示框）
// async 异步的，不是马上按顺序走一遍的
// Future：返回Future类型，异步的
  Future _openSimpleDialog() async {
// await 返回选择的值要等一会儿才能拿到
    final option = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("title"),
            children: <Widget>[
              // Icon(Icons.edit),
              SimpleDialogOption(
                child: Text('OptionA'),
                onPressed: () {
                  Navigator.pop(context, Option.A); //只是关闭对话框
                },
              ),

              SimpleDialogOption(
                child: Text('OptionB'),
                onPressed: () {
                  Navigator.pop(context, Option.B);
                },
              ),

              SimpleDialogOption(
                child: Text('OptionC'),
                onPressed: () {
                  Navigator.pop(context, Option.C);
                },
              ),
            ],
          );
        });

    switch (option) {
      case Option.A:
        setState(() {
          _choice = 'A';
        });
        break;
      case Option.B:
        setState(() {
          _choice = 'B';
        });
        break;
      case Option.C:
        setState(() {
          _choice = 'C';
        });
        break;

      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SimpleDialogDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$_choice'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.format_align_center),
        onPressed: _openSimpleDialog,
      ),
    );
  }
}
