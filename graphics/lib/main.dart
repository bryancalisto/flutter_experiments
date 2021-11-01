import 'package:flutter/material.dart';
import 'package:graphics/transform_widgets/magic_ball.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const Scaffold(
        body: Center(
          child: DefaultTabController(
            length: 2,
            child: TabBarView(
              children: [
                Center(
                  child: MagicBall(),
                ),
                Center(
                  child: Text('another thing'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
