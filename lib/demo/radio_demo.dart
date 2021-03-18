import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _radioGroupA = 0;
  int _radioGroupB = 0;

  void _handleRadioValueChangedA(int value) {
    setState(() {
      _radioGroupA = value;
    });
  }

  void _handleRadioValueChangedB(int value) {
    setState(() {
      _radioGroupB = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RadioDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('RadioGroupValue:$_radioGroupB'),
            SizedBox(
              height: 30.0,
            ),
            RadioListTile(
              value: 0,
              groupValue: _radioGroupB, //控制小圆圈为当前选择的
              onChanged: _handleRadioValueChangedB,
              title: Text('OpationA'),
              subtitle: Text('DescriptionA'),
              secondary: Icon(Icons.bookmark),
              selected: _radioGroupB == 0, //设置图标文字是否是激活/置灰状态
              activeColor: Colors.black,
            ),
            RadioListTile(
              value: 1,
              groupValue: _radioGroupB,
              onChanged: _handleRadioValueChangedB, //选中回调
              title: Text('OpationB'),
              subtitle: Text('DescriptionB'),
              secondary: Icon(Icons.bookmark),
              selected: _radioGroupB == 1,
              activeColor: Colors.black, //选中的颜色
            ),
            Text('RadioValue:$_radioGroupA'),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                  value: 0,
                  groupValue: _radioGroupA,
                  // 函数单独写出来调用
                  onChanged: _handleRadioValueChangedA,
                  activeColor: Colors.green,
                ),
                Radio(
                  value: 1,
                  groupValue: _radioGroupA,
                  // onChanged: (int value){
                  //   setState(() {
                  //     _radioGroupA = value;
                  //   });
                  // },
                  onChanged: _handleRadioValueChangedA,
                  activeColor: Colors.green,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
