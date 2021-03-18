import 'package:flutter/material.dart';

//点击弹出按钮列表
class PopupMenuButtonDemo extends StatefulWidget {
  @override
  _PopupMenuButtonDemoState createState() => _PopupMenuButtonDemoState();
}

class _PopupMenuButtonDemoState extends State<PopupMenuButtonDemo> {
  String _currentMenuItem = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //显示选中的菜单文字
                Text(_currentMenuItem),

                //弹出选择按钮列表
                PopupMenuButton(
                  //点击选择的回调方法
                  onSelected: (value) {
                    print(value);

                    //刷新状态
                    setState(() {
                      _currentMenuItem = value;
                    });
                  },

                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      value: 'Home',
                      child: Text('Home'),
                    ),
                    PopupMenuItem(
                      value: 'School',
                      child: Text('School'),
                    ),
                    PopupMenuItem(
                      value: 'Company',
                      child: Text('Company'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
