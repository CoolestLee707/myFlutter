import 'package:flutter/material.dart';
import './button_demo.dart';
import './floating_action_button_demo.dart';
import './popup_menu_button_demo.dart';
import './form_demo.dart';
import './checkbox_demo.dart';
import './radio_demo.dart';
import './switch_demo.dart';
import './slider_demo.dart';
import './datetime_demo.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material Components'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(
            title: 'ButtonDemo---按钮集合',
            page: ButtonDemo(),
          ),
          ListItem(
            title: 'FloatingActionButton---悬浮按钮',
            page: FloatingActionButtonDemo(),
          ),
          ListItem(
            title: 'PopupMenuButton--点击弹出按钮列表',
            page: PopupMenuButtonDemo(),
          ),
          ListItem(
            title: 'FormDemo----表单',
            page: FormDemo(),
          ),

          // 创建用户输入相关的小部件的演示页面---复选框
          ListItem(
            title: 'CheckboxDemo-复选框/带标签与图标的复选框',
            page: CheckboxDemo(),
          ),
          // 单选按钮
         ListItem(
            title: 'RadioDemo--单选按钮',
            page: RadioDemo(),
          ),

         ListItem(
            title: 'SwitchDemo--开关',
            page: SwitchDemo(),
          ),

         ListItem(
            title: 'SliderDemo--滑动选择器',
            page: SliderDemo(),
          ),

          ListItem(
            title: 'DateTimeDemo--显示格式化日期，弹出时间选择器，第三方包使用',
            page: DateTimeDemo(),
          ),

        ],
      ),
    );
  }
}

// listview的瓦片ListTile,并传值了title和点击后跳转的widget
class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  //构造函数
  ListItem({
    this.title,
    this.page,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),

      // 1、
      // onTap: () {
      //   Navigator.of(context).push(
      //     MaterialPageRoute(
      //       builder: (BuildContext context) => page,
      //     ),
      //   );
      // },

      //2
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => page)),
    );
  }
}


//模板
// return Scaffold(
//       appBar: AppBar(
//         title: Text("CheckboxDemo"),
//         elevation: 0.0,
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
                
//               ],
//             )
//           ],
//         ),
//       ),
//     );