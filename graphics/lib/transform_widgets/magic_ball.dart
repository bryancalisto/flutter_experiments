import 'package:flutter/material.dart';
import 'package:graphics/transform_widgets/ball_3d.dart';

class MagicBall extends StatefulWidget {
  static const lightSource = Offset(0.0, -0.75);

  const MagicBall({Key? key}) : super(key: key);

  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  Offset tapPosition = Offset.zero;

  void _updatePan(Offset position, Size size) {
    setState(() {
      tapPosition = Offset(2 * position.dx / size.width - 1, 2 * position.dy / size.height - 1);

      // Max range of movement
      if (tapPosition.distance > 0.85) {
        tapPosition = Offset.fromDirection(tapPosition.direction, 0.85);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = Size.square(MediaQuery.of(context).size.shortestSide / 1.5);

    return GestureDetector(
      onPanUpdate: (newPosition) => _updatePan(newPosition.localPosition, size),
      child: Ball3D(
        text: 'SOME SHIT',
        windowPosition: tapPosition,
        color: Colors.black,
        size: size,
        lightSource: MagicBall.lightSource,
      ),
    );
  }
}
