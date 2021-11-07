import 'package:flutter/material.dart';
import 'package:graphics/drawing_board/drawer.dart';
import 'package:graphics/drawing_board/drawn_path.dart';
import '../utils.dart' as utils;

class DrawingPage extends StatefulWidget {
  const DrawingPage({Key? key}) : super(key: key);

  @override
  _DrawingPageState createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPage> {
  late List<Offset> pathPoints;
  List<DrawnPath> paths = [];
  // Using queue instead of stack because didn't want to implement a stack
  utils.Stack<DrawnPath> pathsForRedoingUndone = utils.Stack<DrawnPath>();
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
      pathsForRedoingUndone.push(paths.last);
      paths.removeLast();
    }
  }

  void redo() {
    if (!pathsForRedoingUndone.isEmpty) {
      final path = pathsForRedoingUndone.pop();
      paths.add(path);
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
            bottom: 10,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    RoundButtonWithIcon(
                      onPressed: undo,
                      color: Colors.black,
                      icon: const Icon(Icons.undo, color: Colors.white),
                    ),
                    RoundButtonWithIcon(
                      onPressed: redo,
                      color: Colors.black,
                      icon: const Icon(Icons.redo, color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SelectColorButton(
                      onPressed: () => setState(() => color = Colors.black),
                      color: Colors.black,
                      isSelected: color == Colors.black,
                    ),
                    SelectColorButton(
                      onPressed: () => setState(() => color = Colors.green),
                      color: Colors.green,
                      isSelected: color == Colors.green,
                    ),
                    SelectColorButton(
                      onPressed: () => setState(() => color = Colors.red),
                      color: Colors.red,
                      isSelected: color == Colors.red,
                    ),
                    SelectColorButton(
                      onPressed: () => setState(() => color = Colors.yellow),
                      color: Colors.yellow,
                      isSelected: color == Colors.yellow,
                    ),
                    SelectColorButton(
                      onPressed: () => setState(() => color = Colors.white),
                      color: Colors.white,
                      isSelected: color == Colors.white,
                    ),
                  ],
                ),
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

class SelectColorButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final bool isSelected;

  const SelectColorButton({
    Key? key,
    required this.onPressed,
    required this.color,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: isSelected
          ? Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 0.5),
              ),
            )
          : Container(),
      style: TextButton.styleFrom(
        shape: const CircleBorder(),
        side: const BorderSide(color: Colors.grey),
        backgroundColor: color,
        padding: const EdgeInsets.all(10),
      ),
    );
  }
}

class RoundButtonWithIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final Icon icon;

  const RoundButtonWithIcon({Key? key, required this.onPressed, required this.color, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: icon,
      style: TextButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: color,
        padding: const EdgeInsets.all(10),
      ),
    );
  }
}
