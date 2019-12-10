import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   
    // return TextDemo();
    // return RichTextDemo();
    return Container(
      // color: Colors.yellow,
      decoration: BoxDecoration(//设置背景图片
        image: DecorationImage(
          // image: AssetImage(assetName),//项目里图片
          image: NetworkImage('http://pic.90sjimg.com/back_pic/qk/back_origin_pic/00/02/28/8b36588d8d1651bbcc9d68d3f6a6eb84.jpg'),//网络图片
          alignment: Alignment.topCenter,
          // repeat: ImageRepeat.repeatY,
          fit: BoxFit.cover,
        )
      ),
      // alignment: Alignment.topCenter,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,//主轴对齐方式
        children: <Widget>[
          Container(
            child: Icon(Icons.pool,size: 32.0,color: Colors.white,),
            // color: Colors.red,
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.all(10.0),
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(color: Colors.black,width: 3.0,style: BorderStyle.solid),
              // borderRadius: BorderRadius.circular(16.0),//设置四个角圆角
              // borderRadius: BorderRadius.only(//四个角单独设置圆角
              //   topLeft: Radius.circular(10.0),
              //   topRight: Radius.circular(15.0),
              //   bottomLeft: Radius.circular(20.0),
              //   bottomRight: Radius.circular(25.0),
              // ),

              boxShadow: [//添加阴影效果
                BoxShadow(
                  offset: Offset(0.0, 18.0),//x轴和y轴的偏移
                  color: Colors.red,//阴影颜色
                  blurRadius: 25.0,//模糊程度，越大越明显
                  spreadRadius: -10.0,//正数扩大阴影面积，负数缩小阴影面积
                ),
                // BoxShadow(
                //   offset: Offset(10.0, 18.0),//x轴和y轴的偏移
                //   color: Colors.blue,//阴影颜色
                //   blurRadius: 25.0,//模糊程度，越大越明显
                //   spreadRadius: 10.0,//正数扩大阴影面积，负数缩小阴影面积
                // ),
              ],
              shape: BoxShape.circle,//设置盒子的形状，不可以同时设置圆角

              // gradient: RadialGradient(//镜像渐变
              //   colors: [
              //     Colors.red,Colors.yellow,Colors.lightBlue,
              //     ],
              // ),
                gradient: LinearGradient(//线性渐变
                  colors: [
                  Colors.red,Colors.yellow,Colors.lightBlue,
                  ],

                  begin: Alignment.topLeft,//开始
                  end: Alignment.bottomCenter,//结束
                )
            ),
          ),
          
        ],
      ),
    );
  }
}

class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(//富文本
     text: TextSpan(
        text:'李斯特',
        style:TextStyle(
        color: Colors.green,
        fontSize: 40.0,
        fontStyle: FontStyle.italic,//斜体
        fontWeight: FontWeight.w400,//加粗
        ),
        children: [//拼接的孩子们,默认和父亲一样
          TextSpan(
            text: '.com',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}


class TextDemo extends StatelessWidget {

  final TextStyle _textStyle = TextStyle(
    fontSize: 18.0,
    color: Colors.deepPurple,
  );

  final String _auther = '李白';
  final String _title = '将进酒';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
    '《$_title》--- $_auther。君不见，黄河之水天上来，奔流到海不复回。君不见，高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来。烹羊宰牛且为乐，会须一饮三百杯。岑夫子，丹丘生，将进酒，杯莫停。与君歌一曲，请君为我倾耳听。钟鼓馔玉不足贵，但愿长醉不复醒。古来圣贤皆寂寞，惟有饮者留其名。陈王昔时宴平乐，斗酒十千恣欢谑。主人何为言少钱，径须沽取对君酌。五花马，千金裘，呼儿将出换美酒，与尔同销万古愁。',
    textAlign: TextAlign.left,
    style: _textStyle,
    maxLines: 4,//行数
    overflow: TextOverflow.ellipsis,//省略方式...
    );
  }
}
