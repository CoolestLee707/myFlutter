import 'package:flutter/material.dart';

// 创建用户输入相关的小部件的演示页面
class CheckboxDemo extends StatefulWidget {
  @override
  _CheckboxDemoState createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {

  bool _checkboxItemA = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckboxDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CheckboxListTile(
              value: _checkboxItemA,
              onChanged: (value) {
                setState(() {
                  _checkboxItemA = value;
                });
              },
              title: Text('Checkbox Item A'),
              subtitle: Text('Description'),
              secondary: Icon(Icons.bookmark),
              selected: _checkboxItemA,//设置图标文字是否是激活/置灰状态
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                // Checkbox(
                //   value: _checkboxItemA,//是否选中

                //   // 点击会产生与当前不一样的新的值value，需要保存
                //   onChanged: (value){

                //     //刷新状态,重新渲染:value: _checkboxItemA,
                //     setState(() {
                //       _checkboxItemA = value;
                //     });
                //     debugPrint('$value');
                //   },
                //   activeColor: Colors.red,//复选框按钮颜色
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}

