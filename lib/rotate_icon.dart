import 'package:flutter/material.dart';

/// Class use to render an animated icon with rotation
class RotateIcon extends StatefulWidget {
  final Widget? child;
  final Duration? duration;
  RotateIcon({Key? key, this.child, this.duration}) : super(key: key);

  @override
  _RotateIconState createState() =>
      _RotateIconState(child: child, duration: duration);
}

class _RotateIconState extends State<RotateIcon>
    with SingleTickerProviderStateMixin {
  /// Controller to animate the children
  late AnimationController _animationController;

  /// Widget (icon) to show into the dialog
  final Widget? child;

  /// Duration for the animation
  final Duration? duration;

  _RotateIconState({this.child, this.duration = const Duration(seconds: 1)});

  @override
  void initState() {
    super.initState();
    if (mounted) {
      _animationController = new AnimationController(
        vsync: this,
        duration: duration,
      );
      _animationController.repeat();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: child,
      builder: (BuildContext context, Widget? _widget) {
        return new Transform.rotate(
          angle: _animationController.value * 6.3,
          child: _widget,
        );
      },
    );
  }
}
