import 'dart:async';
import 'package:flutter/material.dart';

// 第1个小部件
class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

// 拿到这个类，并执行里面的方法
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    // return Center(
    //   child: ActionChip(
    //     label: Text('0'),
    //     onPressed: () {
    //       // _counterBloc.log();
    //       _counterBloc.counter.add(1);
    //     },
    //   ),
    // );
    return Center(
      child: StreamBuilder(
        initialData: 0,
        stream: _counterBloc.count,//用 Stream 输出数据
        builder: (context, snapshot) {
          return ActionChip(
            label: Text('${snapshot.data}'),
            onPressed: () {
              // 用 Sink 输入数据
              _counterBloc.counter.add(1);
            },
          );
        },
      ),
    );
  }
}

// 第2个小部件
class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        // _counterBloc.log();
        // 用 Sink 输入数据
        _counterBloc.counter.add(2);
      },
    );
  }
}

// 这个包住一些控件
class CounterProvider extends InheritedWidget {
  final Widget child;
  final CounterBloc bloc;
  
  CounterProvider({
    this.child,
    this.bloc,
    
  }) : super(child: child);

  static CounterProvider of(BuildContext context) =>
  
      // Before
      // context.inheritFromWidgetOfExactType(CounterProvider);
      // After
      context.dependOnInheritedWidgetOfExactType<CounterProvider>();
      

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}

// 这个类被CounterProvider持有了--，别人都能访问
class CounterBloc {

// 用来计数
  int _count = 0;

// 1-----用 Sink 输入数据
// 定义一个StreamController，主要是用他里面的sink添加数据
  final _counterActionController = StreamController<int>();
  // get方法，返回sink
  StreamSink<int> get counter => _counterActionController.sink;


// 2-----用 Stream 输出数据
  final _counterController = StreamController<int>();
  // get方法，返回Stream
  Stream<int> get count => _counterController.stream;


// 在构造方法里添加监听--有数据（点击）就执行onData，onData把数据累加起来交给_counterController控制的stream，使用它的get就可以拿到数据了
  CounterBloc () {
    _counterActionController.stream.listen(onData);
  }
  
  // 执行拿到数据要做的事
  void onData (int data) {
    print('$data');
    
    _count = data + _count;
    _counterController.add(_count);

  }

// 移除监听
  void dispose () {
    _counterActionController.close();
    _counterController.close();
  }

  void log () {
      print('BLOC ');
  }
}

