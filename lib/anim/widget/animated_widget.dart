import 'package:flutter/cupertino.dart';

///通过addListener()和setState() 来更新UI这一步其实是通用的，如果每个动画中都加这么一句是比较繁琐的。
///AnimatedWidget类封装了调用setState()的细节，并允许我们将 widget 分离出来
class AnimatedImage extends AnimatedWidget {
  const AnimatedImage({
    Key key,
    Animation<double> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Image.asset(
        "images/pic9.jpg",
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}
