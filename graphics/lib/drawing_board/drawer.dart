import 'package:flutter/material.dart';
import 'package:graphics/drawing_board/drawn_path.dart';

class CustomDrawer extends CustomPainter {
  final List<DrawnPath> paths;

  CustomDrawer({required this.paths});

  @override
  void paint(Canvas canvas, Size size) {
    if (paths.isNotEmpty) {
      for (DrawnPath currentPath in paths) {
        Paint _paint = Paint()..style = PaintingStyle.stroke;
        _paint.color = currentPath.color;
        _paint.strokeWidth = currentPath.width;

        Path _path = Path();
        _path.moveTo(currentPath.pathPoints.first.dx, currentPath.pathPoints.first.dy);
        for (int i = 1; i < currentPath.pathPoints.length; i++) {
          _path.lineTo(currentPath.pathPoints[i].dx, currentPath.pathPoints[i].dy);
        }

        canvas.drawPath(_path, _paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
