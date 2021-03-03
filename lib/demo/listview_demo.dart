import 'package:flutter/material.dart';
import '../model/post.dart'; //     ../表示上一级目录
import './post_show.dart'; //详情页

class listViewDemo extends StatelessWidget {
  //类似cell
  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.green[100],
      margin: EdgeInsets.all(10.0),
      // child: ColumnDemo(dataIndex: index,),//路由之前的
      child: Stack(
        children: <Widget>[
          ColumnDemo(
            dataIndex: index,
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                  //InkWell：添加溅墨动画效果
                  splashColor: Colors.black.withOpacity(0.3), //溅墨颜色
                  highlightColor: Colors.red.withOpacity(0.1),
                  onTap: () {
                    // main 文件里写好了路由跳转方式这里可以跳转about页面
                    // Navigator.pushNamed(context, '/about');

                    Navigator.of(context).push(MaterialPageRoute(
                        // 以下两种写法都可以
                        // builder: (context) => PostShow(post: posts[index],)
                        builder: (BuildContext context) => PostShow(
                              post: posts[index],
                            )));
                  }),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: _listItemBuilder,
    );
  }
}

//路由之前的
class ColumnDemo extends StatelessWidget {
  final int dataIndex;
  ColumnDemo({
    this.dataIndex,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AspectRatio(
          //设置图片比例
          aspectRatio: 16 / 9,
          child: Image.network(
            posts[dataIndex].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        // Image.network(
        //   posts[dataIndex].imageUrl,
        //   // width: 400.0,
        //   // height: 180.0,
        //   // fit: BoxFit.fitHeight,
        // ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          // posts[index].title,
          '标题：${posts[dataIndex].title}',
          style: Theme.of(context).textTheme.title,
        ),
        Text(
          '作者：${posts[dataIndex].auther}',
          // posts[index].auther,
          style: Theme.of(context).textTheme.subhead,
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
