import 'package:flutter/material.dart';

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