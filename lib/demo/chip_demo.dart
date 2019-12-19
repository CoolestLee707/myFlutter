import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = [
    'Apple',
    'banana',
    'Oragne',
    'Lemon',
    'Watermelon',
    'milk',
  ];

  String _action = 'Nothing';

  List<String> _selected = [];

  String _choice = 'Lemon';
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
            // Wrap可以换行展示
            Wrap(
              spacing: 5.0, //左右间隔
              runSpacing: 8.0, //行与行之间的间隔
              children: <Widget>[
                Chip(
                  label: Text('chip'),
                ),

                Chip(
                  label: Text('chip'),
                  backgroundColor: Colors.red,
                ),

                Chip(
                  label: Text('Life'),
                  backgroundColor: Colors.lightGreenAccent,

                  //左边的圆圈
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('李'),
                  ),
                ),

                Chip(
                  label: Text('Life jdfsfjsdfjsfjsl gdfgdfgd'),
                  backgroundColor: Colors.lightGreenAccent,
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://b-ssl.duitang.com/uploads/blog/201404/14/20140414152949_BYjee.jpeg',
                    ),
                  ),
                ),

                // 带删除功能的chip
                Chip(
                  label: Text('City'),
                  deleteIcon: Icon(Icons.delete), //自定义删除按钮
                  deleteIconColor: Colors.red, //删除按钮的颜色
                  deleteButtonTooltipMessage:
                      'Remove this tag? ', //长按删除按钮会弹出这个提示

                  //删除按下方法
                  onDeleted: () {
                    debugPrint('Delete');
                  },
                ),
                // 就是一条分隔线
                Divider(
                  height: 25.0, //占的地高度，并不是线变宽
                  color: Colors.red,
                  indent: 32.0, //左边缩进
                ),

                //基于列表生成chips
                Wrap(
                  spacing: 8.0,
                  // _tags迭代处理数组中的元素，map()里放方法
                  children: _tags.map((tag) {
                    return Chip(
                      label: Text(tag),
                      onDeleted: () {
                        setState(() {
                          _tags.remove(tag);
                        });
                      },
                    );
                  }).toList(),
                ),

                Divider(
                  height: 25.0, //占的地高度，并不是线变宽
                  color: Colors.red,
                  indent: 32.0, //左边缩进
                ),

                Container(
                  width: double.infinity,
                  child: Text('ActionChip: $_action'),
                ),
              //  ActionChip ----- 动作碎片
                Wrap(
                  spacing: 8.0,
                  // _tags迭代处理数组中的元素，map()里放方法
                  children: _tags.map((tag) {
                    return ActionChip(
                      label: Text(tag),
                      onPressed: (){
                        debugPrint(tag);
                        setState(() {
                          _action = tag;
                        });
                      },
                    );
                  }).toList(),
                ),


                Divider(
                  height: 25.0, //占的地高度，并不是线变宽
                  color: Colors.red,
                  indent: 32.0, //左边缩进
                ),

                Container(
                  width: double.infinity,
                  child: Text('FilterChip: ${_selected.toString()}'),//将_selected数组选中的项变成字符串
                ),
              //  FilterChip -------------- 过滤碎片
                Wrap(
                  spacing: 8.0,
                  // _tags迭代处理数组中的元素，map()里放方法
                  children: _tags.map((tag) {
                    return FilterChip(
                      label: Text(tag),
                      selected: _selected.contains(tag),
                      onSelected: (value){

                        setState(() {
                          if (_selected.contains(tag)) {
                            _selected.remove(tag);
                          } else {
                            _selected.add(tag);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),


                Divider(
                  height: 25.0,
                  color: Colors.red,
                  indent: 32.0,
                ),

                Container(
                  width: double.infinity,
                  child: Text('FilterChip: $_choice'),
                ),
              //  ChoiceChip -------------- 选择碎片
                Wrap(
                  spacing: 8.0,
                  // _tags迭代处理数组中的元素，map()里放方法
                  children: _tags.map((tag) {
                    return ChoiceChip(
                      label: Text(tag),
                      selected: _choice == tag,
                      selectedColor: Colors.green,
                      onSelected: (value){

                        setState(() {
                          _choice = tag;
                        });
                      },
                    );
                  }).toList(),
                )

              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _tags = [
              'Apple',
              'banana',
              'Oragne',
              'Lemon',
              'Watermelon',
              'milk',
            ];

            _selected = [];

            _choice = 'Lemon';
          });
        },
      ),
    );
  }
}
