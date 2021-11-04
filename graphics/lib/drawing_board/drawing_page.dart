import 'package:flutter/material.dart';
import 'package:graphics/drawing_board/drawer.dart';
import 'package:graphics/drawing_board/drawn_path.dart';

class DrawingPage extends StatefulWidget {
  const DrawingPage({Key? key}) : super(key: key);

  @override
  _DrawingPageState createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPage> {
  late List<Offset> pathPoints;
  List<DrawnPath> paths = [];
  late DrawnPath currentPath;
  double width = 2;
  Color color = Colors.black;

  GestureDetector buildCurrentPath(BuildContext context) {
    return GestureDetector(
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      child: Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: CustomPaint(painter: CustomDrawer(paths: paths)),
      ),
    );
  }

  void undo() {
    if (paths.isNotEmpty) {
      paths.removeLast();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          buildCurrentPath(context),
          Positioned(
            right: 10,
            top: 10,
            child: Column(
              children: [
                TextButton(
                  onPressed: undo,
                  child: const Icon(Icons.undo, color: Colors.white),
                  style: TextButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.all(10),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void onPanStart(DragStartDetails details) {
    if (mounted) {
      final point = (context.findRenderObject() as RenderBox).globalToLocal(details.globalPosition);
      pathPoints = <Offset>[];
      currentPath = DrawnPath(pathPoints: pathPoints, width: width, color: color);
      paths.add(currentPath);
      setState(() {
        pathPoints.add(point);
      });
    }
  }

  void onPanUpdate(DragUpdateDetails details) {
    if (mounted) {
      final point = (context.findRenderObject() as RenderBox).globalToLocal(details.globalPosition);
      setState(() {
        pathPoints.add(point);
      });
    }
  }

  void onPanEnd(DragEndDetails details) {
    if (mounted) {
      print('finished drawing');
      setState(() {});
    }
  }
}
