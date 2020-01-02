import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //主轴对齐方式
        // mainAxisAlignment: MainAxisAlignment.spaceAround,//剩余空间平均分布在每个控件两侧
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,//剩余空间均匀分布在之间，两头靠边
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,//剩余空间平均分配大小
        mainAxisAlignment: MainAxisAlignment.center,

        // crossAxisAlignment: CrossAxisAlignment.stretch,//拉伸铺满
        // crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[
          // IconBadge(Icons.backup,color: Colors.black,),
          // IconBadge(Icons.update,size:50.0,color: Colors.red,),
          // IconBadge(Icons.chat,color: Colors.red,),

          // ConstrainedBox(
          //   constraints: BoxConstraints(
          //     minHeight: 200.0,
          //     maxHeight: 250.0,
          //     minWidth: 100.0,
          //     maxWidth: 150.0,
          //   ),
          //   child: Container(
          //     color: Colors.yellow,
          //   ),
          // ),

          // 一摞小部件
          StackDemo(),

          // 宽高比
          AspectRatioDemo(),
        ],
      ),
    );
  }
}

class AspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        print('fdsfdsfds');
      },
      child: SizedBox(
        width: 100.0,
        height: 100.0,
        child: AspectRatio(
          aspectRatio: 3.0 / 1.5,
          child: Container(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.bottomLeft, //Stack设置就会以第一个为底重叠，并以第一个为容器去对齐
      children: <Widget>[
        SizedBox(
          //Creates a fixed size box
          width: 200.0,
          height: 300.0,
          // child: Icon(Icons.filter,color: Colors.green,size: 40.0,),
          child: Container(
            // alignment: Alignment(-1.0, -1.0),
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(7.0),
            ),
            child: Icon(
              Icons.filter,
              color: Colors.purple,
              size: 40.0,
            ),
          ),
        ),
        SizedBox(
          width: 30.0,
          height: 20.0,
        ),
        SizedBox(
          //Creates a fixed size box
          width: 80.0,
          height: 80.0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.red,
                  Colors.black,
                ],
              ),
            ),
            child: Icon(
              Icons.tab,
              color: Colors.white,
              size: 40.0,
            ),
          ),
        ),
        Positioned(
          //相对于最大的控件的位置
          right: 20.0,
          top: 30.0,
          child: Icon(Icons.access_time, color: Colors.deepPurple, size: 22.0),
        )
      ],
    );
  }
}

class IconBadge extends StatelessWidget {
  // 这里定义的变量可以作为参数
  final IconData icon;
  final double size;
  final Color color;

  IconBadge(
    this.icon, {
    // 重写方法，设置下不传参数的默认值
    this.size = 32.0,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon, size: size, color: color),
      width: size + 60,
      height: size + 60,
      color: Colors.blueAccent,
    );
  }
}
