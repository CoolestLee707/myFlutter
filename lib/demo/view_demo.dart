import 'package:flutter/material.dart';
import '../model/post.dart';

class ViewDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

        //1.类似ScrollView
    // return PageViewDemo();

    // 有数据的
    // return PageViewBuilderDemo();


      // 类似collectionview
      // return GridViewCountDemo();


      // return GridViewExtentDemo(); 


      // 带index索引的
      return GridViewBuilderDemo();

  }
}

// 带index索引的
class GridViewBuilderDemo extends StatelessWidget {

  Widget _gridItemBuilder(BuildContext context,int index) {
    return Container(
      color: Colors.grey,
      child: Image.network(
        posts[index].imageUrl,
        fit: BoxFit.cover,
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      itemCount: posts.length,
      itemBuilder: _gridItemBuilder,

      // 设置数量，item的边长自适应
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,//每行数量
        crossAxisSpacing: 8.0,//交叉轴间距
        mainAxisSpacing: 8.0,//主轴方向间距
      ),

      // 设置item的边长最大值，数量自适应
      // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //   maxCrossAxisExtent: 100,//每个item最大边长
      //   mainAxisSpacing: 8.0,//主轴方向间距
      //   crossAxisSpacing: 18.0,//交叉轴间距
      // ),
    );
  }
}

// 设置交叉轴item的边长最大值，数量自适应
class GridViewExtentDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.extent(
        maxCrossAxisExtent: 100.0,//交叉轴最大值
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        children:_buildTiles(100),//自定义方法，返回100个widget的List
      );
  }
}

// 设置交叉轴每行数量的，item的边长自适应
class GridViewCountDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        scrollDirection: Axis.horizontal,//默认垂直滚动，可以设置水平滚动
        children:_buildTiles(100),//自定义方法，返回100个widget的List
      );
  }
}

 // 自定义的方法,批量瓦片
  List<Widget> _buildTiles(int length) {

    return List.generate(length, (int index) {
      return Container(
            color: Colors.grey[300],
            alignment: Alignment.center,
            child: Text(
              'item $index',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue,fontSize: 20.0),
              ),
          );
    });
  }


class PageViewBuilderDemo extends StatelessWidget {

   Widget _pageItemBuilder(BuildContext context, int index) {
      return Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Image.network(posts[index].imageUrl,fit: BoxFit.cover,),
          ),
          Positioned(
            bottom: 10.0,
            left: 10.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  // 'rere:${posts[index].title}',
                  posts[index].title,
                  style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.yellow),
                ),
                 Text(
                  posts[index].auther,
                  style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.normal,color: Colors.yellowAccent),
                ),
              ],

            ),
          ),
        ],
      );
    }
    
  @override
  Widget build(BuildContext context) {
    
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _pageItemBuilder,
    );
  }
}


//1.PageView，类似UIScrollView
class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(
      // pageSnapping: false,//分页效果
      // reverse: true,//倒置
      // scrollDirection: Axis.vertical,//滚动方向
      onPageChanged: (currentPage) => debugPrint('Page:$currentPage'), //输出当前第几页

      controller: PageController(
        initialPage: 1, //设置默认进来第几个页面
        // keepPage: false,//默认记住
        viewportFraction: 0.8, //占用80%，
      ),

      children: <Widget>[
        Container(
          // margin: EdgeInsets.all(10.0),
          color: Colors.red,
          child: Text(
            'One',
            style: TextStyle(color: Colors.blue, fontSize: 40.0),
          ),
          alignment: Alignment(0.0, 0.0),
        ),
        Container(
          color: Colors.yellow,
          child: Text(
            'Two',
            style: TextStyle(color: Colors.blue, fontSize: 40.0),
          ),
          alignment: Alignment(0.0, 0.0),
        ),
        Container(
          color: Colors.green,
          child: Text(
            'Three',
            style: TextStyle(color: Colors.blue, fontSize: 40.0),
          ),
          alignment: Alignment(0.0, 0.0),
        ),
      ],
    );
  }
}
