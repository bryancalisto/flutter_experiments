import 'package:flutter/material.dart';
import 'dart:math' as math;

class Ball3D extends StatelessWidget {
  final Color color;
  final Size size;
  final Offset lightSource;
  final Offset windowPosition;
  final String text;
  const Ball3D({
    Key? key,
    required this.size,
    required this.lightSource,
    required this.color,
    required this.windowPosition,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final diameter = size.shortestSide;
    final innerCircleThinShadowWidth = lightSource.distance * 0.1;
    final innerCircleThinShadowOffset = Offset.fromDirection(
      math.pi + lightSource.direction,
      innerCircleThinShadowWidth,
    );
    final scaleByDistance = 0.15 * windowPosition.distance;

    return Stack(
      children: [
        /*SHADOW BENEATH BALL*/
        Transform(
          origin: Offset(1, diameter + 5),
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
            origin: size.center(windowPosition),
            transform: Matrix4.identity()
              ..translate(windowPosition.dx * size.width / 2, windowPosition.dy * size.height / 2)
              ..scale(0.5 - scaleByDistance)
              ..rotateZ(windowPosition.direction)
              ..rotateY(windowPosition.distance * math.pi / 2)
              ..rotateZ(-windowPosition.direction),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
                gradient: RadialGradient(
                  center: Alignment(innerCircleThinShadowOffset.dx, innerCircleThinShadowOffset.dy),
                  colors: const [Colors.grey, Colors.black],
                  stops: [1 - innerCircleThinShadowWidth, 1],
                ),
              ),
              child: Transform(
                transform: Matrix4.identity()..scale(0.5 - scaleByDistance),
                alignment: const Alignment(0, 0),
                child: Container(
                  padding: const EdgeInsets.all(30),
                  child: Center(
                    child: Text(
                      text,
                      style: TextStyle(color: Colors.black, fontSize: 60 - scaleByDistance),
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
        ),
        /*SHADOW ILLUSION THAT SURROUNDS BALL*/
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
