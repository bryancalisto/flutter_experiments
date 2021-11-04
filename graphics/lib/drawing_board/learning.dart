import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    for (double i = 0; i < 3; i++) {
      drawStairs(canvas, 20, 30, Offset(10 + i * 5, 10 + i * 5));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void drawStairs(Canvas canvas, int stairs, double step, Offset origin) {
    Paint paint = Paint()..style = PaintingStyle.stroke;
    double x = origin.dx;
    double y = origin.dy;

    Path path = Path();
    path.moveTo(x, y);

    for (int i = 0; i < stairs; i++) {
      if (i & 1 == 0) {
        y += step;
      } else {
        x += step;
      }

      path.lineTo(x, y);
    }

    canvas.drawPath(path, paint);
  }
}
