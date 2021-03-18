import 'package:flutter/material.dart';

//push到的第一个页面
class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// 定义FlatButton，Create a simple text button.
    final Widget flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // 文字按钮
        FlatButton(
          child: Text('button1'),
          //  onPressed: null,//按钮置灰，禁用状态
          onPressed: () {
            debugPrint('press button1');
          },
          splashColor: Colors.red, //溅墨效果颜色
          textColor: Theme.of(context).accentColor, //文字颜色
          color: Colors.red,
        ),

        // 带图标的按钮
        FlatButton.icon(
          icon: Icon(Icons.dashboard), //设置图标
          label: Text('button2'), //设置文字
          onPressed: () {
            debugPrint('press button2');
          },
          splashColor: Colors.red, //溅墨效果颜色
          textColor: Theme.of(context).accentColor, //文字颜色
        ),
      ],
    );

// 定义RaisedButton,多了阴影和背景色
    final Widget raisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // 文字按钮
        // 放到一个theme里面
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.circular(5.0),
              // ),
              shape: StadiumBorder(),
            ),
          ),
          child: RaisedButton(
            child: Text('button3'),
            //  onPressed: null,//按钮置灰，禁用状态
            onPressed: () {
              debugPrint('press button3');
            },
            elevation: 0.0,
            splashColor: Colors.red, //溅墨效果颜色

            // color: Theme.of(context).accentColor,//背景颜色
            // textColor: Colors.white, //文字颜色
            // textTheme: ButtonTextTheme.primary,
          ),
        ),

        // 加点间隔
        SizedBox(
          width: 16.0,
        ),

        // 带图标的按钮
        RaisedButton.icon(
          icon: Icon(Icons.dashboard), //设置图标
          label: Text('button4'), //设置文字
          onPressed: () {
            debugPrint('press button4');
          },
          elevation: 12.0,
          splashColor: Colors.red, //溅墨效果颜色
          textColor: Theme.of(context).accentColor, //文字颜色
        ),
      ],
    );

// OutlineButton   --有描边效果
    final Widget outlineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // 文字按钮
        // 放到一个theme里面
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.circular(5.0),
              // ),
              shape: StadiumBorder(),
            ),
          ),
          child: OutlineButton(
            child: Text('button5'),
            //  onPressed: null,//按钮置灰，禁用状态
            onPressed: () {
              debugPrint('press button5');
            },
            splashColor: Colors.red, //溅墨效果颜色

            // color: Theme.of(context).accentColor,//背景颜色
            // textColor: Colors.white, //文字颜色
            // textTheme: ButtonTextTheme.primary,
          ),
        ),

        // 加点间隔
        SizedBox(
          width: 16.0,
        ),

        // 带图标的按钮
        OutlineButton.icon(
          icon: Icon(Icons.dashboard), //设置图标
          label: Text('button6'), //设置文字
          onPressed: () {
            debugPrint('press button6');
          },
          splashColor: Colors.red, //溅墨效果颜色
          textColor: Theme.of(context).accentColor, //文字颜色
        ),

        // 加点间隔
        SizedBox(
          width: 16.0,
        ),

        OutlineButton.icon(
          icon: Icon(Icons.title), //设置图标
          label: Text('button7'), //设置文字
          onPressed: () {
            debugPrint('press button7');
          },
          splashColor: Colors.red, //溅墨效果颜色
          highlightColor: Colors.grey,
          textColor: Colors.black, //文字颜色

          //设置描边效果
          borderSide: BorderSide(
            color: Colors.black, //描边颜色
          ),
        ),
      ],
    );

// 设置按钮容器 Container：有固定宽度的按钮,放到Container里面
    final Widget outlineButtonContainDemo = Container(
      width: 130.0,
      child: OutlineButton(
        child: Text('button8'),
        onPressed: () {
          debugPrint('press button8');
        },
        splashColor: Colors.grey[100],
        borderSide: BorderSide(
          color: Colors.black,
        ),
        textColor: Colors.black,
        highlightedBorderColor: Colors.red,
      ),
    );

// 设置按钮容器 Expanded,占满父控件的主轴方向,---------布局、优先级
    final Widget expandedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: OutlineButton(
            child: Text('button8'),
            onPressed: () {
              debugPrint('press button8');
            },
            splashColor: Colors.grey[100],
            borderSide: BorderSide(
              color: Colors.black,
            ),
            textColor: Colors.black,
            highlightedBorderColor: Colors.red,
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          flex: 2, //应该是倍数，默认是1
          child: OutlineButton(
            child: Text('button9'),
            onPressed: () {
              debugPrint('press button9');
            },
            splashColor: Colors.grey[100],
            borderSide: BorderSide(
              color: Colors.black,
            ),
            textColor: Colors.black,
            highlightedBorderColor: Colors.red,
          ),
        ),
      ],
    );

// 设置按钮容器 ButtonBar,占满父控件的主轴方向中间有个间隔,---------中间间隔随主题一样
    final Widget buttonBarDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
              buttonTheme: ButtonThemeData(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
          )),
          child: ButtonBar(
            children: <Widget>[
              OutlineButton(
                child: Text('button10'),
                onPressed: () {
                  debugPrint('press button10');
                },
                splashColor: Colors.grey[100],
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                textColor: Colors.black,
                highlightedBorderColor: Colors.red,
              ),
              OutlineButton(
                child: Text('button11'),
                onPressed: () {
                  debugPrint('press button11');
                },
                splashColor: Colors.grey[100],
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                textColor: Colors.black,
                highlightedBorderColor: Colors.red,
              ),
            ],
          ),
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //按钮------------------

            //简单的文字按钮，可以带icon
            flatButtonDemo,

            //多了阴影和背景色
            raisedButtonDemo,

            //带边框按钮
            outlineButtonDemo,

            //放到Container里设置大小
            outlineButtonContainDemo,

            //占满父控件的主轴方向
            expandedButtonDemo,

            //中间有间隔
            buttonBarDemo,

            //按钮------------------
          ],
        ),
      ),
    );
  }
}
