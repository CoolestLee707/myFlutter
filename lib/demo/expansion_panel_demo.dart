import 'package:flutter/material.dart';


//相当于模型了
class ExpansionPaneItem {
  final String headerText;
  final Widget body;
  bool isExpanded;

  //构造函数
  ExpansionPaneItem({
    this.headerText,
    this.body,
    this.isExpanded,
  });
}

class ExpansionPanelDemo extends StatefulWidget {
  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  // bool _isExpanded = false;

// 装模型的数组
  List<ExpansionPaneItem> _expansionPanelItems;

// 初始化方法
  @override
  void initState() {
    super.initState();
    _expansionPanelItems = <ExpansionPaneItem>[

      ExpansionPaneItem(
        headerText: 'Pabel A',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel A'),
        ),
        isExpanded: false,
      ),

      ExpansionPaneItem(
        headerText: 'Pabel B',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel B'),
        ),
        isExpanded: false,
      ),

      ExpansionPaneItem(
        headerText: 'Pabel C',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel C'),
        ),
        isExpanded: false,
      ),

    ];
  }

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

            ExpansionPanelList(
              //点击箭头会触发的方法
              expansionCallback: (int panelIndex, bool ixExpanded) {
                setState(() {
                  // 保存好状态刷新
                  // _isExpanded = !ixExpanded;
                  _expansionPanelItems[panelIndex].isExpanded = !ixExpanded;
                });
              },

              // 列表通过循环_expansionPanelItems数组来创建
              children: _expansionPanelItems.map(
                (ExpansionPaneItem item) {
                  return ExpansionPanel(
                    isExpanded: item.isExpanded,
                    body: item.body,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          item.headerText,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.title,
                        ),
                      );
                    },
                  );
                }
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}






  //  ExpansionPanel(
  //                 //收缩时只展示的
  //                 headerBuilder: (BuildContext context, bool isExpanded) {
  //                   if (isExpanded) {
  //                     return Container(
  //                       padding: EdgeInsets.all(16.0),
  //                       child: Text(
  //                         'Panel A 展开',
  //                         textAlign: TextAlign.start,
  //                         style: Theme.of(context).textTheme.title,
  //                       ),
  //                     );
  //                   } else {
  //                     return Container(
  //                       padding: EdgeInsets.all(16.0),
  //                       child: Text(
  //                         'Panel A 收起',
  //                         textAlign: TextAlign.start,
  //                         style: Theme.of(context).textTheme.title,
  //                       ),
  //                     );
  //                   }
  //                 },

  //                 //body展开的内容
  //                 body: Container(
  //                   padding: EdgeInsets.all(16.0),
  //                   width: double.infinity,
  //                   child: Text('Content for Panel A'),
  //                 ),

  //                 isExpanded: _isExpanded,
  //               ),