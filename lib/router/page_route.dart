import 'package:flutter/cupertino.dart';

class PageRouter<T> extends PageRouteBuilder<T> {
  final Widget child;

  PageRouter({RouteSettings settings, this.child})
      : super(
          settings: settings,
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              child,
          transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(parent: animation, curve: Curves.linear)),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: Offset.zero,
                end: const Offset(-1.0, 0.0),
              ).animate(CurvedAnimation(
                  parent: secondaryAnimation, curve: Curves.linear)),
              child: child,
            ),
          ),
          transitionDuration: const Duration(microseconds: 300),
        );
}
