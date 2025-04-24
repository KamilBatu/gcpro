import 'package:flutter/material.dart';

// ignore: strict_raw_type
class CustomPageRoute extends PageRouteBuilder {
  final Widget child;
  CustomPageRoute({required this.child})
      : super(
          transitionDuration: Duration(microseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return super.buildTransitions(
        context,
        animation,
        secondaryAnimation,
        ScaleTransition(
          scale: animation,
          child: child,
        ));
  }
}
