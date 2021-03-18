import 'package:flutter/material.dart';
import '../model/post.dart';

//这是详情页。push进来，传递了model数据
class PostShow extends StatelessWidget {
  final Post post;
  //构造函数
  PostShow({
    @required this.post,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('${post.title}'),
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            Image.network(
              post.imageUrl,
            ),
            Container(
              padding: EdgeInsets.all(32.0),
              color: Colors.red[50],
              width: double.infinity, //容器占满所有宽度
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${post.title}',
                    style: Theme.of(context).textTheme.title,
                  ),
                  Text(
                    '${post.auther}',
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  Text(
                    '${post.description}',
                    style: Theme.of(context).textTheme.body1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
