import 'package:flutter/material.dart';
import 'package:flutter_stadia_app/style_guide/color.dart';

class GameProgressWidget extends StatefulWidget {
  final double progress, screenWidth;

  const GameProgressWidget(this.progress, this.screenWidth);

  @override
  _GameProgressWidgetState createState() => _GameProgressWidgetState();
}

class _GameProgressWidgetState extends State<GameProgressWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _progressAnimationController;
  Animation _progressAnimation;
  double animationProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _progressAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _progressAnimation = Tween<double>(
            begin: 0.0, end: (widget.screenWidth - 16) * 0.3 * widget.progress)
        .animate(CurvedAnimation(
            parent: _progressAnimationController, curve: Curves.decelerate))
          ..addListener(() {
            setState(() {
              animationProgress = _progressAnimation.value;
            });
          });

    _progressAnimationController.forward();
  }

  @override
  void dispose() {
    _progressAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        height: 10,
        width: (widget.screenWidth - 16) * 0.3,
        decoration: BoxDecoration(
            border: Border.all(color: tertiaryTextColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(4))),
      ),
      Container(
        height: 10,
        width: animationProgress,
        decoration: BoxDecoration(
            gradient: appGradient,
            borderRadius: BorderRadius.all(Radius.circular(4))),
      )
    ]);
  }
}
