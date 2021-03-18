import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

// This class (or a class which this class inherits from) is marked as '@immutable', but one or more of its instance fields are not final: StateManagementDemo.count
// final int count = 0;

class StateManagementDemo extends StatefulWidget {
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  int _count = 0;

// 这个方法，父辈按钮点击执行这个方法，还传递给了孩子，孩子点击了执行一个回调-还是这个方法，就是孩子让老父亲去走这个方法
// 类似block
  void _increaseCount() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
// 1、dependOnInheritedWidgetOfExactType

    return CounterProvider(
      count: _count,
      increaseCount: _increaseCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementDemo'),
          elevation: 0.0,
        ),
        // body: Counter(_count, _increaseCount),
        // body: CounterWrapper(_count, _increaseCount),
        body: CounterWrapper(),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _increaseCount,
        ),
      ),
    );
  }
}
// ----------------------------------------------------------------------------------------

// 中间加了一层响应，需要把参数和时间都传递过去
class CounterWrapper extends StatelessWidget {
  // final int count; //父辈传来的值
  // final VoidCallback increaseCount; //给父辈的回调

  // CounterWrapper(this.count, this.increaseCount);

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: Counter(count, increaseCount),
      child: Counter(),
    );
  }
}

//需要响应时间的最底层了
class Counter extends StatelessWidget {
  // final int count; //父辈传来的值
  // final VoidCallback increaseCount; //给父辈的回调

  // Counter(this.count, this.increaseCount);
  // 用父辈传来的参数重新构建build方法

  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider.of(context).count;
    final VoidCallback increaseCount =
        CounterProvider.of(context).increaseCount;

    return ActionChip(
      label: Text('$count'),
      onPressed: increaseCount,
    );
  }
}

// ----------------------------------------------------------------------------------------
// 1、创建与使用 InheritedWidget（dependOnInheritedWidgetOfExactType） 有效地传递数据给子部件,相当于贯穿整个传递链，旁观者
class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  CounterProvider({
    this.count,
    this.increaseCount,
    this.child,
  }) : super(child: child);

  static CounterProvider of(BuildContext context) =>
      // context.inheritFromWidgetOfExactType(CounterProvider);
      context.dependOnInheritedWidgetOfExactType<CounterProvider>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}

// ----------------------------------------------------------------------------------------
// 2、使用 ScopedModel （三方库）传递数据

class CounterModel extends Model {
  int _count = 0;
  // get 方法，名字count，返回_count
  int get count => _count;

  void increaseCount() {
    _count++;
    notifyListeners(); //监听的小部件会重建
  }
}

class ScopedModelDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ScopedModel<Model>包裹MaterialApp
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('ScopedModelDemo'),
          elevation: 0.0,
        ),

        body: ScopedModelCounterWrapper(),

// 监听floatingActionButton的变化，可设置是否监听rebuildOnChange
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange: true,
          builder: (BuildContext context, Widget child, CounterModel model) =>
              FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: model.increaseCount,
          ),
        ),
      ),
    );
  }
}

class ScopedModelCounterWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScopedModelCounter(),
    );
  }
}

class ScopedModelCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterModel>(
      builder: (context, _, model) => ActionChip(
        label: Text('${model.count}'),
        onPressed: model.increaseCount,
      ),
    );
  }
}
