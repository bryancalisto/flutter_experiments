import 'package:flutter/material.dart';
import 'package:graphics/drawing_board/drawer.dart';
import 'package:graphics/drawing_board/drawn_path.dart';

import 'learning.dart';

class DrawingPage extends StatefulWidget {
  const DrawingPage({Key? key}) : super(key: key);

  @override
  _DrawingPageState createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPage> {
  List<Offset> pathPoints = [];

  GestureDetector buildCurrentPath(BuildContext context) {
    return GestureDetector(
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      child: Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: CustomPaint(painter: CustomDrawer(pathPoints: pathPoints)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildCurrentPath(context),
      ],
    );
  }

  void onPanStart(DragStartDetails details) {
    if (mounted) {
      final point = (context.findRenderObject() as RenderBox).globalToLocal(details.globalPosition);
      pathPoints.clear();
      setState(() {
        pathPoints.add(point);
      });
    }
  }

  void onPanUpdate(DragUpdateDetails details) {
    if (mounted) {
      final point = (context.findRenderObject() as RenderBox).globalToLocal(details.globalPosition);
      pathPoints.add(point);
      setState(() {});
    }
  }

  void onPanEnd(DragEndDetails details) {
    if (mounted) {
      print('finished drawing');
    }
    setState(() {});
  }
}
