import 'package:flutter/material.dart';
import 'package:graphics/ball_3d.dart';
import 'package:graphics/magic_ball.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: Center(
          child: MagicBall(),
        ),
      ),
    );
  }
}