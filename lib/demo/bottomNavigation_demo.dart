import 'package:flutter/material.dart';

import 'basic_demo.dart';
import 'drawer_demo.dart';
import 'layout_demo.dart';
import 'listview_demo.dart';
import 'material_components.dart';
import 'sliver_demo.dart';
import 'view_demo.dart';

import '../model/post.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavigationDemoState();
  }
}

class _BottomNavigationDemoState extends State<BottomNavigationBarDemo> {
  
   int _currentIndex = 0;

   void _onTapHandler (int index) {
     setState(() {//刷新状态
        _currentIndex = index;
     });
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.black,//激活状态下的颜色
          currentIndex: _currentIndex,
          onTap: _onTapHandler,//点击会调用这个方法去重新渲染
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              title: Text('Explore'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              title: Text('History'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('List'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.filter),
              title: Text('Filter'),
            ),
          ],
          
        );
  }
}

// -------------------底部tabar可切换--------------------------
class HomeDemo extends StatefulWidget {
  @override
  _HomeDemoState createState() => _HomeDemoState();
}

class _HomeDemoState extends State<HomeDemo> {

  List<Widget> list = List();
  int _currentIndex = 0;

  @override
  void initState() {
    // ..谁用完这个方法还返回谁，就可以继续使用
    list
      ..add(OneWidgetDemo())
      ..add(MaterialComponents())
      ..add(ThreeWidgetDemo())
      ..add(SliverDemo());
    super.initState();
  }

  void _onTapHandler(int index) {
    setState(() {
      //刷新状态
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black, //激活状态下的颜色
        currentIndex: _currentIndex,
        onTap: _onTapHandler,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              title: Text('Explore'),
            ),
          BottomNavigationBarItem(
              icon: Icon(Icons.history),
              title: Text('History'),
            ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('List'),
            ),
          BottomNavigationBarItem(
              icon: Icon(Icons.filter),
              title: Text('Filter'),
            ),
        ],
      ),
    );
  }
}


class OneWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: new Text('one'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              // onPressed: () => debugPrint('Search button is pressed'),
              onPressed: () => Navigator.pushNamed(context, '/mdc'),
            )
          ],
          elevation: 0.0,
          bottom: TabBar(
            unselectedLabelColor: Colors.red, //按钮未被选中颜色
            indicatorColor: Colors.black, //线的颜色
            indicatorSize: TabBarIndicatorSize.label, //线的长度
            indicatorWeight: 3.0, //线的粗细
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.local_florist),
              ),
              Tab(
                icon: Icon(Icons.change_history),
              ),
              Tab(
                icon: Icon(Icons.directions_bike),
              ),
              Tab(
                icon: Icon(Icons.view_quilt),
              ),
              Tab(
                icon: Icon(Icons.view_column),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            listViewDemo(),
            BasicDemo(),
            LayoutDemo(),
            ViewDemo(),
            SliverDemo(),
          ],
        ),

        // drawer: Text('this is a drawer'),//左边边界右滑
        // endDrawer: Text('right drawer'),//右边左滑
        drawer: drawerDemo(),
      ),
    );
  }
}

class TwoWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TwoWidgetDemo'),
        elevation: 0.0,
      ),
      body: Center(
        child: Text('2'),
      ),
    );
  }
}

class ThreeWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ThreeWidgetDemos'),
        elevation: 0.0,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverListDemo(),
        ],
      ),
    );
  }
}

class FourWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FourWidgetDemo'),
        elevation: 0.0,
      ),
      body: Center(
        child: Text('4'),
      ),
    );
  }
}