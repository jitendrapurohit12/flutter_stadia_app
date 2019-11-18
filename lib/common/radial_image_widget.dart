import 'package:flutter/material.dart';
import 'package:flutter_stadia_app/style_guide/color.dart';
import 'package:flutter_stadia_app/style_guide/text_style.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class RadialImage extends StatefulWidget {
  final bool isOnline, showScore;
  final String imageUrl, name;
  final int score;
  final double imageSize;

  const RadialImage(
      {this.isOnline = false,
      this.showScore = false,
      this.imageUrl,
      this.name = '',
      this.score,
      this.imageSize = 80});

  @override
  _RadialImageState createState() => _RadialImageState();
}

class _RadialImageState extends State<RadialImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: widget.imageSize + 8,
          width: widget.imageSize,
          child: Stack(children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: CustomPaint(
                child: Container(
                  height: widget.imageSize,
                  width: widget.imageSize,
                  child: ClipOval(
                      child: Image.asset(widget.imageUrl,fit: BoxFit.cover,)),
                ),
                painter: RadialImagePainter(widget.isOnline),
              ),
            ),
            if (widget.showScore)
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      gradient: appGradient, shape: BoxShape.circle),
                  child: Center(
                      child: Text(
                    '20',
                    style: rankTextStyle,
                  )),
                ),
              )
          ]),
        ),
        Text(
          widget.name,
          style: bodyTextStyle,
        )
      ],
    );
  }
}

class RadialImagePainter extends CustomPainter {
  final bool isOnline;

  RadialImagePainter(this.isOnline);

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    Paint radialPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    if (isOnline)
      radialPaint.shader = appGradient.createShader(
          Rect.fromCircle(center: center, radius: size.width / 2));
    else
      radialPaint.color = tertiaryTextColor;

    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90), math.radians(360), false, radialPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
