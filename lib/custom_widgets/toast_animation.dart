import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class ToastMessageAnimation extends StatelessWidget {
  final Widget child;
  final int time;

  const ToastMessageAnimation({Key key, this.child, this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track('translateY')
          .add(Duration(milliseconds: 250), Tween(begin: -100.0, end: 0.0), curve: Curves.easeOut)
          .add(Duration(seconds: time ~/ 2, milliseconds: 250), Tween(begin: 0.0, end: 0.0))
          .add(Duration(milliseconds: 250), Tween(begin: 0.0, end: -100.0), curve: Curves.easeIn),
      Track('opacity')
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0))
          .add(Duration(seconds: time ~/ 2), Tween(begin: 1.0, end: 1.0))
          .add(Duration(milliseconds: 500), Tween(begin: 1.0, end: 0.0))
    ]);
    return CustomAnimation(
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: animation['opacity'],
        child: Transform.translate(offset: Offset(0, animation['translateY']), child: child),
      ),
    );
  }
}
