import 'package:flutter/material.dart';
import '../model/post.dart';

class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;
  @override
  // TODO: implement rowCount
  int get rowCount => _posts.length;

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => _selectedCount;

  @override
  DataRow getRow(int index) {
    final Post post = _posts[index];
    // TODO: implement getRow
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(post.title)),
        DataCell(Text(post.auther)),
        DataCell(Image.network(post.imageUrl)),
      ],
    );
  }

// 定义_sort方法，getField(post)是对应的第一个参数
  void _sort(getField(post), bool asceding) {
    _posts.sort((a, b) {
      if (!asceding) {
        final c = a;
        a = b;
        b = c;
      }

      // 用一下传递的方法获取一下长度
      final aValue = getField(a);
      final bValue = getField(b);

      return Comparable.compare(aValue, bValue);
      // 或
      // return Comparable.compare(a.title.length, b.title.length);
    });

    notifyListeners();
  }
}

class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  int _sortColumnIndex = 0; //排序第几个
  bool _sortAscending = true; //是否升序

  final PostDataSource _postDataSource = PostDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PaginatedDataTableDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            PaginatedDataTable(
              header: Text('Posts'),
              rowsPerPage: 5, //控制每页显示的数量，默认每页显示10个
              source: _postDataSource,
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              columns: [
                DataColumn(
                  label: Text('title'),
                  onSort: (int columnIndex, bool ascending) {
                    setState(() {
                      _sortColumnIndex = columnIndex;
                      _sortAscending = ascending;

                      // _sort有两个参数，一个参数是方法(post) => post.title.length，
                      // 这个方法就是传一个model，会返回这个model的title的长度
                      // 第二个参数是ascending，是否使用升序排列
                      _postDataSource._sort(
                          (post) => post.title.length, ascending);
                    });
                  },
                ),
                DataColumn(
                  label: Text('auther'),
                ),
                DataColumn(
                  label: Text('Image'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
