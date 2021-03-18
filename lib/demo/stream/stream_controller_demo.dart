import 'package:flutter/material.dart';
import 'dart:async';

class StreamControllerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamControllerDemo'),
        elevation: 0.0,
      ),
      body: StreamControllerDemoHome(),
    );
  }
}

class StreamControllerDemoHome extends StatefulWidget {
  @override
  _StreamControllerDemoHomeState createState() =>
      _StreamControllerDemoHomeState();
}

class _StreamControllerDemoHomeState extends State<StreamControllerDemoHome> {
// 1---StreamController
  StreamSubscription _streamControllerDemoSubscription;
  StreamController<String> _streamControllerDemo;

// 2---使用 Sink 往 Stream 上添加数据
  StreamSink _sinkDemo;

  // 3---在界面上显示 Stream 上的数据
  String _data = '...';

  @override
  void dispose() {
    // 把小部件移除掉会执行dispose方法，把不需要的stream关掉
    _streamControllerDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

// StreamController----没有直接执行方法
    // _streamControllerDemo = StreamController<String>();

// 创建可以多次订阅的 Broadcast Streams
    _streamControllerDemo = StreamController.broadcast();

// sink
    _sinkDemo = _streamControllerDemo.sink;

    _streamControllerDemoSubscription =

        //监听，以使用Stream中的数据，使用onData方法来处理数据，3秒后stream有值了执行onData
        _streamControllerDemo.stream
            .listen(onData, onError: onError, onDone: onDone);

    //又添加了一个监听
    _streamControllerDemo.stream
        .listen(onDataTwo, onError: onError, onDone: onDone);
  }

// 有数据---秒后data有值了执行这个方法
  void onData(String data) {
    print('----$data');
    setState(() {
      _data = data;
    });
  }

// 这是多个订阅
  void onDataTwo(String data) {
    print('++++$data');
  }

// 发生错误执行的方法
  void onError(Error) {
    print('Error - $Error');
  }

// 完成执行的方法-----成功失败都会执行的
  void onDone() {
    print('Done');
  }

// 模拟延时操作，网络异步请求
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));

    // 模拟成功
    return 'hello ~';

    // 模拟错误
    // throw ('Something happend');
  }

// --------------------------------------------------------------
// 暂停订阅----点击几次暂停就得点击几次恢复才能恢复
  void _pauseStream() {
    print('Pause subscription');
    _streamControllerDemoSubscription.pause();
  }

// 恢复订阅
  void _resumeStream() {
    print('Resume subscription');
    _streamControllerDemoSubscription.resume();
  }

// 取消订阅----取消了就没了
  void _cancelStream() {
    print('Cancel subscription');
    _streamControllerDemoSubscription.cancel();
  }

  void _addDataToStream() async {
    print('add data to stream');
    String data = await fetchData(); //点击才执行fetchData方法
    print('data is already');

//StreamController控制stream
    // _streamControllerDemo.add(data);
// 或
// 使用 Sink 往 Stream 上添加数据
    _sinkDemo.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('类似NSOperation多线程控制'),
            SizedBox(
              height: 20.0,
            ),
            // Text('$_data'),

// StreamBuilder：根据 Stream 上的数据构建小部件,不需要setState,就可以动态构建刷新
            StreamBuilder(
              stream: _streamControllerDemo.stream,
              initialData: '', //设置初始数据
              builder: (context, snapshot) {
                return Text('${snapshot.data}');
              },
            ),

            FlatButton(
              child: Text('Add'),
              onPressed: _addDataToStream,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('Pause'),
                  onPressed: _pauseStream,
                ),
                FlatButton(
                  child: Text('Resume'),
                  onPressed: _resumeStream,
                ),
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: _cancelStream,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
