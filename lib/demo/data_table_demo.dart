import 'package:flutter/material.dart';
import '../model/post.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex = 0;//排序第几个
  bool _sortAscending = true;//是否升序

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DataTableDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            DataTable(

              //排序，会出现箭头,默认升序
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,//true升序↓，false降序↑
              //表头标题
              columns: [
                DataColumn(
                  label: Text('title'),

                  //点击表头会调用的方法
                  onSort: (int index,bool ascending){

                    // ascending表示是否使用升序排列，与当前相反
                    setState(() {
                      _sortColumnIndex = index;
                      _sortAscending = ascending;

                      posts.sort((a,b){
                        if (!ascending) {
                          // 降序排列
                          final c = a;
                          a = b;
                          b = c;
                        }
                        //比较的内容 ---- 按字符串长度排序
                        return a.title.length.compareTo(b.title.length);
                      });
                    });
                  },
                  // 自定义宽度
                  // label: Container(
                  //   width: 150.0,
                  //   child: Text('title'), 
                  // )
                ),
                DataColumn(
                  label: Text('auther'),
                ),

                DataColumn(
                  label: Text('Image'),
                ),
                
              ],
              // 内容---要和标题数量一致
              //-------手动设置数据
              // rows: [
              //   DataRow(
              //     cells: [
              //       DataCell(Text('Hello world')),
              //       DataCell(Text('coolest')),
              //       DataCell(Text('Flutter')),
              //     ],
              //   ),
              //   DataRow(
              //     cells: [
              //       DataCell(Text('你好')),
              //       DataCell(Text('李斯特')),
              //       DataCell(Text('跨平台')),
              //     ],
              //   ),
              // ],

              // ----model数据设置
              rows: posts.map((post){
                return DataRow(
                  selected: post.selected,//是否选中
                  onSelectChanged: (bool value) {
                    // value点击将要变得值
                    setState(() {
                      if (post.selected != value) {
                        post.selected = value;
                      }
                    });
                  },
                  cells: [
                    DataCell(Text(post.title)), 
                    DataCell(Text(post.auther)),
                    DataCell(Image.network(post.imageUrl)),

                  ],
                );
              }).toList(),

            ),
          ],
        ),
      ),
    );
  }
}
