import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/demo/animation/animation_demo.dart';
import 'package:myflutter/demo/bloc/bloc_demo.dart';
import 'package:myflutter/demo/http/http_demo.dart';
import 'package:myflutter/demo/rxdart/rxdart_demo.dart';
import 'package:myflutter/demo/state/state_management_demo.dart';
import 'package:myflutter/demo/stream/stream_demo.dart';
import 'package:myflutter/demo/stream/stream_controller_demo.dart';
import './demo/listview_demo.dart';
import './demo/hello_demo.dart';
import './demo/drawer_demo.dart';
import './demo/bottomNavigation_demo.dart';
import './demo/basic_demo.dart';
import './demo/layout_demo.dart';
import './demo/view_demo.dart';
import './demo/sliver_demo.dart';
import './demo/navigator_demo.dart';
import './demo/form_demo.dart';
import './demo/material_components.dart';

void main() => runApp(listApp());

class listApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 是否打开性能监控，覆盖在屏幕最上面
      showPerformanceOverlay: false,
      // 是否显示右上角的Debug标签
      debugShowCheckedModeBanner: false,
      // 是否打开显示到屏幕外位图的图层的检查面板
      checkerboardOffscreenLayers: false,
      // 是否打开栅格缓存图像的检查板
      checkerboardRasterCacheImages: false,
      // 是否显示网格
      debugShowMaterialGrid: false,
      // 是否打开覆盖图，显示框架报告的可访问性信息 显示边框
      showSemanticsDebugger: false,

      title: 'hello',
      // home: Home(),//appBar
      // home: SliverDemo(),

      // home: NavigatorDemo(),
      // routes: {
      //   '/about':(context) => Page('BT', 'ZBT'),
      // },

      // 带名字的路由,/代表路由的根，默认是 MaterialApp里面home设置的小部件，可以手动设置
      // initialRoute: '/',//设置路由一开始要显示的（初始路由）

      initialRoute: '/animation', //设置路由一开始要显示的（初始路由）

      routes: {
        //设置怎么出现的
        '/': (context) => Home(), //设置路由的根
        '/about': (context) => Page('BT', 'ZBT'),
        '/form': (context) => FormDemo(),
        '/mdc': (context) => MaterialComponents(),

        // 状态管理
        '/state-management': (context) => StateManagementDemo(),
        '/state-scopedModel': (context) => ScopedModelDemo(),

        
        '/stream': (context) => StreamDemo(),
        '/streamController': (context) => StreamControllerDemo(),

        
        // '/rxdart': (context) => RxDartDemo(),

        '/bloc': (context) => BlocDemo(),

        '/http': (context) => HttpDemo(),

        '/animation': (context) => AnimationDemo(),

      },

      // initialRoute: '/about',//设置路由的根,一开始要显示的
      // routes: {
      //   '/':(context) => NavigatorDemo(),//设置路由的根
      //   '/about':(context) => Page('BT', 'ZBT'),
      // },

      theme: ThemeData(
        primarySwatch: Colors.yellow, //可以改变导航栏颜色
        highlightColor: Colors.red, //按钮点击时的颜色
        splashColor: Colors.yellowAccent, //水波纹的颜色
        accentColor: Colors.blue,
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   tooltip: 'Navigation',
          //   onPressed: () => debugPrint('Navigation button is pressed'),
          // ),
          title: new Text('TabBar'),
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
        bottomNavigationBar: BottomNavigationBarDemo(),
      ),
    );
  }
}
