import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

// Rx ----- Reactive Extensions,响应式编程,基于Stream

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
        elevation: 0.0,
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {

// Observables使用
  @override
  void initState() {
    super.initState();
    

    Observable<String> _observable = 
        Observable(Stream.fromIterable(['hello','flutter','coolest']));
    _observable.listen(print);

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}