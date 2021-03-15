import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AnimApp extends StatefulWidget {
  _AnimAppState createState() => _AnimAppState();
}

class _AnimAppState extends State<AnimApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    // #docregion addListener
    animation = Tween<double>(begin: 50, end: 300).animate(controller);
    animation.addListener(() {
      // #enddocregion addListener
      setState(() {
        // The state that has changed here is the animation object’s value.
      });
      // #docregion addListener
    });
    animation.addStatusListener((status) {
      print('$status');
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    // #enddocregion addListener
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
