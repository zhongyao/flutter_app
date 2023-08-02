import 'package:flutter/cupertino.dart';

class HeroAnimationRouteB extends StatelessWidget {
  const HeroAnimationRouteB({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.asset("images/pic20.jpg"),
      ),
    );
  }
}
