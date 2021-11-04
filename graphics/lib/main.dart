import 'package:flutter/material.dart';
import 'package:graphics/drawing_board/drawing_page.dart';
import 'package:graphics/transform_widgets/magic_ball.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentViewIndex = 0;
  final List<Widget> _tabsContent = const [
    Center(child: MagicBall()),
    Center(child: DrawingPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: DefaultTabController(
        length: _tabsContent.length,
        child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.black,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.transform, color: Colors.white), label: 'Transform'),
                BottomNavigationBarItem(icon: Icon(Icons.art_track, color: Colors.white), label: 'Canvas'),
              ],
              iconSize: 30,
              onTap: (int index) => setState(() => _currentViewIndex = index),
              currentIndex: _currentViewIndex,
              selectedItemColor: Colors.grey,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              showSelectedLabels: true,
            ),
            body: _tabsContent[_currentViewIndex]),
      ),
    );
  }
}
