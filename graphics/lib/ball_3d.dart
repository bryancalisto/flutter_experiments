import 'package:flutter/material.dart';
import 'dart:math' as math;

class Ball3D extends StatelessWidget {
  final Color color;
  final Size size;
  final Offset lightSource;
  const Ball3D({Key? key, required this.size, required this.lightSource, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final diameter = size.shortestSide;

    return Stack(
      children: [
        /*SHADOW BENEATH BALL*/
        Transform(
          origin: Offset(1, diameter + 14),
          transform: Matrix4.identity()..rotateX(math.pi / 2.2),
          child: Container(
            width: diameter,
            height: diameter,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 25,
                  color: Colors.grey.withOpacity(0.9),
                )
              ],
            ),
          ),
        ),
        /*MAIN CIRCULAR SHAPE*/
        Container(
          width: diameter,
          height: diameter,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              center: Alignment(lightSource.dx, lightSource.dy),
              colors: [Colors.white, color],
            ),
          ),
          /*SURFACE CIRCULAR CUT*/
          child: Transform(
            origin: size.center(Offset.zero),
            transform: Matrix4.identity()..scale(0.5),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        /*SHADOW ILLUSION WITHIN BALL*/
        Container(
          width: diameter,
          height: diameter,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: diameter,
                color: Colors.grey.withOpacity(0.9),
              )
            ],
          ),
        ),
      ],
    );
  }
}
