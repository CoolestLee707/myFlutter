import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HttpsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
        elevation: 0.0,
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {

  @override
  void initState() {

    super.initState();

    // dataExchange();


      // fetchPosts();
        // .then((value) => print(value));


  }

    // Model map json 转换
    dataExchange () {
        // map类型的数据
      final post = {
        'title': 'hello',
        'description': 'ni hao beijing',
      };

      print(post['title']);
      print(post['description']);

      // map转json,----发给后端
      final postJson = json.encode(post);
      print('json ---- ${postJson}');

      // json转map，---解析数据
      final postJsonConverted = json.decode(postJson);
      print(postJsonConverted['title']);
      print(postJsonConverted['description']);
      print(postJsonConverted is Map);

      // map转model,因为model用起来方便有提示
      final postModel = Post.fromJson(postJsonConverted);
      print('title: ${postModel.title},description: ${postModel.description}');

      // model直接转json，encode自动调用tojson方法
      print('${json.encode(postModel)}');
    }

    Future<List<Post>> fetchPosts() async {
      final response = await http.get('https://resources.ninghao.net/demo/posts.json');

      // print('-- ${response.statusCode}');
      // print('-- ${response.body}');

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);//先转map,在把里面的字典转model
        List<Post> posts = responseBody['posts']
          .map<Post>((item) => Post.fromJson(item))
          .toList();
          // print(posts);
        return posts;
      } else {
        throw Exception('Failed');
      }

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPosts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print('data: ${snapshot.data}');
        print('connectionState: ${snapshot.connectionState}');
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text('loading...'),
          );
        }
         return ListView(
            children: snapshot.data.map<Widget>((item) {
              return ListTile(
                title: Text(item.title),
                subtitle: Text(item.author),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(item.imageUrl),
                ),
              );
            }).toList(),
          );
      },
    );
  }
}




// json --> Map - Model

// Model
class Post {
  final int id;
  final String title;
  final String author;
  final String description;
  final String imageUrl;

// 构造方法
  Post(
    this.id,
    this.title,
    this.author,
    this.description,
    this.imageUrl,
  );

// map -> model:   转换对应关系
  Post.fromJson(Map json)
    : id = json['id'],
      title = json['title'],
      author = json['author'],
      description = json['description'],
      imageUrl = json['imageUrl'];


// model -> map 
  Map toJson() => {
    'id': id,
    'title': title,
    'author': author,
    'description': description,
    'imageUrl': imageUrl,
  };
}