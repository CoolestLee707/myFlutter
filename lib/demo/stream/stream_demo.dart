import 'package:flutter/material.dart';
import 'dart:async';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {

  StreamSubscription _streamDemoSubscription;

  @override
  void initState() {
    super.initState();

    print('Create');

    // 类似异步执行任务，最后返回主线程一样，监听了这个stream就可以知道他里面的子线程执行完

    // 用fetchData方法初始化一个stream,直接就执行fetchData方法的
    Stream<String> _streamDemo = Stream.fromFuture(fetchData());


    print('start listing');

    _streamDemoSubscription = _streamDemo.listen(onData,
        onError: onError,
        onDone: onDone); //监听，以使用Stream中的数据，使用onData方法来处理数据，3秒后stream有值了执行onData

    print('complete');
  }

// 有数据---3秒后data有值了执行这个方法
  void onData(String data) {
    print('-$data');
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
    // return 'hello ~';

    // 模拟错误
    throw ('Something happend');
  }

// --------------------------------------------------------------
// 暂停订阅----点击几次暂停就得点击几次恢复才能恢复
  void _pauseStream() {
    print('Pause subscription');
    _streamDemoSubscription.pause();
  }

// 恢复订阅
  void _resumeStream() {
    print('Resume subscription');
    _streamDemoSubscription.resume();
  }

// 取消订阅----取消了就没了
  void _cancelStream() {
    print('Cancel subscription');
    _streamDemoSubscription.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('类似NSOperation多线程控制'),
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
