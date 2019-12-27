import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
        elevation: 0.0,
      ),
      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome>
    with TickerProviderStateMixin {
      
  AnimationController animationDemoController;

// 设置动画范围
  Animation animation;

  // 设置动画颜色
  Animation animationColor;

  // Curve：动画曲线
  CurvedAnimation curve;

  @override
  void initState() {
    super.initState();

    animationDemoController = AnimationController(
      // 设置显示数字的范围
      // lowerBound: 50.0,
      // upperBound: 200.0,
      // 设置初始值,从初始值开始到达最大值
      // value: 100.0,
      duration: Duration(milliseconds: 2000), //动画持续时间1000毫秒
      vsync: this,
    );

// 设置曲线。可以把动画的parent设置成curve
    curve = CurvedAnimation(
        parent: animationDemoController, curve: Curves.bounceOut);

// Tween：设置动画范围值（数字、颜色）
// animation----获取animationDemoController的animation
    animation = Tween(
      begin: 32.0,
      end: 100.0,
    ).animate(curve);

    animationColor =
        ColorTween(begin: Colors.red, end: Colors.black).animate(curve);

// 添加监听输出每帧,输出次数取决于-设置的时间*设备每秒显示的帧数
    animationDemoController.addListener(() {
      // print('${animationDemoController.value}');

      // 每帧都刷新
      setState(() {});
    });

// 监听动画运行的状态,根据不同的状态做不同的事情
// AnimationStatus.forward -- AnimationStatus.completed,AnimationStatus.dismissed
    animationDemoController.addStatusListener((AnimationStatus status) {
      print(status);
    });
// 开始动画
    // animationDemoController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationDemoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          // ActionChip(
          //   label: Text('${animationDemoController.value}'),
          //   onPressed: () {
          //     // 点击开始计时
          //     animationDemoController.forward();
          //   },
          // ),
          AnimatedHeart(
            animations: [animation,animationColor],
            controller: animationDemoController,
          ),
          IconButton(
            icon: Icon(
              Icons.favorite,
            ),
            // iconSize: animationDemoController.value,
            color: animationColor.value,
            iconSize: animation.value,

            onPressed: () {
              // animationDemoController.forward();

              switch (animationDemoController.status) {
                case AnimationStatus.completed:
                  animationDemoController.reverse(); //高到低
                  break;
                default:
                  animationDemoController.forward(); //低到高
              }
            },
          ),
        ],
      ),
    );
  }
}

// AnimatedWidget：动画值有变化就自动重建自己的小部件
class AnimatedHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

// super设置监听的对象
  AnimatedHeart({
    this.animations,
    this.controller,
  }) : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.favorite,
      ),
      iconSize: animations[0].value,
      color: animations[1].value,

      onPressed: () {

        switch (controller.status) {
          case AnimationStatus.completed:
            controller.reverse(); //高到低
            break;
          default:
            controller.forward(); //低到高
        }
      },
    );
  }
}
