import 'dart:math';
import 'package:flutter/material.dart';

class PercentagePainter extends CustomPainter {
  final double percent;

  PercentagePainter({required this.percent});

  @override
  void paint(Canvas canvas, Size size) {
    final double arcAngle = 2 * pi * percent;
    final Paint grayPaint = Paint()
      ..color = Colors.grey.shade200
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    const Gradient gradient = LinearGradient(
      colors: [
        Colors.pink,
        Colors.blue,
        Colors.teal,
      ],

    );

    final Paint gradientPaint = Paint()
      ..shader = gradient
          .createShader(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2),
      0,
      2 * pi,
      false,
      grayPaint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2),
      -pi / 2,
      arcAngle,
      false,
      gradientPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
