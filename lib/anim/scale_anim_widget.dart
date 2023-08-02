import 'package:flutter/cupertino.dart';
import 'package:startup_namer/anim/widget/animated_widget.dart';

//缩放动画
class ScaleAnimWidget extends StatefulWidget {
  const ScaleAnimWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ScaleAnimWidgetState();
  }
}

class _ScaleAnimWidgetState extends State<ScaleAnimWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    //使用弹性曲线
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn);
    //图片宽高从0变到300
    animation = Tween(begin: 0.0, end: 300.0).animate(animation);
    animationController.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed){
        animationController.forward();
      }
    });

    animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedImage(animation: animation),
    );
  }

  @override
  void dispose() {
    //路由销毁时需要释放动画资源
    animationController.dispose();
    super.dispose();
  }
}
