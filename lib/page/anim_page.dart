import 'package:flutter/cupertino.dart';
import 'package:startup_namer/anim/hero_anim_route_a.dart';

import '../anim/scale_anim_widget.dart';

///动画页面
class AnimPage extends StatefulWidget {
  const AnimPage({Key key}) : super(key: key);

  @override
  State<AnimPage> createState() {
    return _AnimPageState();
  }
}

class _AnimPageState extends State<AnimPage> {
  @override
  Widget build(BuildContext context) {
    // return const ScaleAnimWidget();
    return const HeroAnimationRouteA();
  }
}
