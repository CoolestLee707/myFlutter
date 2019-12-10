import 'package:flutter/material.dart';

class NavigatorDemo extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FlatButton(
              child: Text('Home'),
              onPressed: null,
            ),
            FlatButton(
              child: Text('About'),
              // onPressed: () {
              //   Navigator.of(context).push(
              //     MaterialPageRoute(
                      
              //       // builder: (BuildContext context) => Page('anout','852','d'),
              //       // builder: (BuildContext context) => Page(title: 'About',subTitle: '132',auther: 'leeitgg',),
              //       //  builder: (BuildContext context) => Page('标题', 'fubiaoti',auther: '1889779',),
              //        builder: (BuildContext context) => Page('标题', 'fubiaoti'),

              //     ),
              //   );
              // },
              // 打开指定名字的路由
              onPressed: (){
                Navigator.pushNamed(context, '/about');
              },
            ),
          ],
        ),
      ),
    );
  }
}


class Page extends StatelessWidget {
  final String title;
  final String subTitle;
  final String auther;

      // Page(
      //   this.title,
      //   this.subTitle,
      //   this.auther,
      // );
  // Page({
  //   this.title,
  //   this.subTitle,
  //   this.auther = 'leenn',
  // });

 Page(
   this.title,
   this.subTitle,{
   this.auther = 'lee1',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(title),
          title: Text(title + ' ' + subTitle + ' ' + auther),
        elevation: 0.0,
        backgroundColor: Colors.red,
      ),
      // 页面右下角加一个返回的按钮
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}
