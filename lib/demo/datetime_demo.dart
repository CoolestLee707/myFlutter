import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';


class DateTimeDemo extends StatefulWidget {
  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {

  //  定义日期，设置默认值
  DateTime selectedDate = DateTime.now();

  // 定义时间，设置默认值
  TimeOfDay selectedTime = TimeOfDay(hour: 10,minute: 25);

// 选择日期时间过程不会立刻返回值，要用到异步编程
// async  标记为异步
// await  异步等待执行结果


  // 点击选择日期回调方法
   Future<void> _selectDate() async {
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: selectedDate,//当前日期
      firstDate: DateTime(1900),//可选最早日期
      lastDate: DateTime(2100),//可选最晚日期
    );
    //点击cance不处理
    if(date == null) return;

    // 点击OK刷新
    setState(() {
      selectedDate = date;
    });
  }


  // 点击时间选择方法
  Future<void> _selectTime() async {
    final TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if(time == null) return;

    setState(() {
      selectedTime = time;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckboxDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: _selectDate,
                  child: Row(
                    children: <Widget>[
                      Text(DateFormat.yMd().format(selectedDate)),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
                InkWell(
                  onTap: _selectTime,
                  child: Row(
                    children: <Widget>[
                      Text(selectedTime.format(context)),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
