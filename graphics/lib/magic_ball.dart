import 'package:flutter/material.dart';
import 'package:graphics/ball_3d.dart';

class MagicBall extends StatefulWidget {
  static const lightSource = Offset(0.0, -0.75);

  const MagicBall({Key? key}) : super(key: key);

  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  @override
  Widget build(BuildContext context) {
    final size = Size.square(MediaQuery.of(context).size.shortestSide / 1.5);
    return Ball3D(
      color: Colors.black,
      size: size,
      lightSource: MagicBall.lightSource,
    );
  }
}
