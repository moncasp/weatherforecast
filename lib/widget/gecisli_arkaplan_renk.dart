import 'package:flutter/material.dart';

class GecisliRenkContainer extends StatelessWidget {
  final Widget child;
  final MaterialColor renk;

  GecisliRenkContainer({@required this.child, @required this.renk});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [renk.shade800, renk.shade500, renk.shade100],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.6, 0.9, 2])),
    );
  }
}
