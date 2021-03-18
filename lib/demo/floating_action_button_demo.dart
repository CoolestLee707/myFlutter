import 'package:flutter/material.dart';

//push到的第二个页面
class FloatingActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget _floatingActionButton = FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
      elevation: 0.0, //和下一层之间的高度,0就是没有阴影效果，贴合在一起
      backgroundColor: Colors.black, //默认主题颜色
      //设置形状
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(30.0), //设置斜角30.0为菱形
      ),
    );

    final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
      onPressed: () {},
      icon: Icon(Icons.add),
      label: Text('Add'),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
        elevation: 0.0,
      ),

      // 悬浮按钮
      // floatingActionButton: _floatingActionButton,
      floatingActionButton: _floatingActionButtonExtended,

      // 设置悬浮位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.0,
          color: Colors.red,
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}
