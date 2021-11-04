import 'package:flutter/material.dart';

class CustomDrawer extends CustomPainter {
  final List<Offset> pathPoints;

  CustomDrawer({required this.pathPoints});

  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = Paint()..style = PaintingStyle.stroke;
    _paint.color = Colors.black;
    _paint.strokeWidth = 2;
    Path _path = Path();
    _path.moveTo(0, 0);

    if (pathPoints.isNotEmpty) {
      _path.moveTo(pathPoints.first.dx, pathPoints.first.dy);
      for (int i = 1; i < pathPoints.length; i++) {
        _path.lineTo(pathPoints[i].dx, pathPoints[i].dy);
      }
      canvas.drawPath(_path, _paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
