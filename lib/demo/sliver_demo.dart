import 'package:flutter/material.dart';
import '../model/post.dart';

//类似瀑布流
class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          //设置标题栏（类似导航栏）
          SliverAppBar(
            // title: Text(
            //   'flutterdemo'
            // ),
            pinned: true, //固定标题栏
            floating: true, //导航栏上滑消失，下拉马上出现

            expandedHeight: 300.0, //下拉伸缩空间
            flexibleSpace: FlexibleSpaceBar(
              title: Text('I Like Flutter',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.red,
                    letterSpacing: 5.0, //字间距
                  )),
              background: Image.network(
                'https://b-ssl.duitang.com/uploads/item/201701/21/20170121092211_EdcvV.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          SliverGridDemo(),
          // SliverListDemo(),

          // SliverPadding(//内边距
          //   padding: EdgeInsets.all(10.0),
          //   sliver: SliverGridDemo(),
          // ),

          // SliverSafeArea(
          //   //设置安全区域
          //   sliver: SliverGridDemo(),
          // ),

          // SliverSafeArea(
          //   // 设置安全区域+内边距
          //   sliver: SliverPadding(
          //     padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          //     sliver: SliverGridDemo(),
          //     // sliver: SliverListDemo(),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //交叉轴item数量
        crossAxisSpacing: 8.0, //交叉轴item间隔
        mainAxisSpacing: 8.0, //主轴item间隔
        childAspectRatio: 1.0, //每个item的宽高比（交叉轴方向长/主轴方向的长）
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          //返回每个item
          return Container(
            child: Image.network(
              posts[index].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        },
        childCount: posts.length,
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 15.0),
            child: ClipRRect(
              //裁剪出圆角
              borderRadius: BorderRadius.circular(15.0),
              // elevation: 14.0,
              // shadowColor: Colors.grey.withOpacity(0.5),

              // child: Container(
              //   // height: 230.0,
              //   child: Image.network(
              //     posts[index].imageUrl,
              //     fit: BoxFit.cover,
              //   ),
              // ),

              // child: AspectRatio(
              //   aspectRatio: 16/9,//设置比例
              //   child: Image.network(
              //     posts[index].imageUrl,
              //     fit: BoxFit.cover,
              //   ),
              // ),

              child: Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16 / 9, //设置比例
                    child: Image.network(
                      posts[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 20.0,
                    top: 20.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          posts[index].title,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          posts[index].auther,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        childCount: posts.length,
      ),
    );
  }
}
