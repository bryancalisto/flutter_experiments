import 'package:flutter/material.dart';

class DrawnPath {
  final List<Offset> pathPoints;
  final double width;
  final Color color;
  DrawnPath({required this.width, required this.color, required this.pathPoints});
}
