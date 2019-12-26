import 'package:flutter/material.dart';
import 'package:myflutter/demo/bloc/counter_bloc_demo.dart';

// Bloc  反应式应用开发架构，业务逻辑组件
class BlocDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 小部件树被CounterProvider包装了，里面的所有小部件都可以得到CounterBloc里面的东西
    return CounterProvider(
      bloc: CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('BlocDemo'),
          elevation: 0.0,
        ),
        body: CounterHome(),
        floatingActionButton: CounterActionButton(),
      ),
    );
  }
}
