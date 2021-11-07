import 'package:flutter/material.dart';
import 'package:state_management/bloc/bloc_app.dart';
import 'package:state_management/get_it/get_it_app.dart';

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
    GetItApp(),
    BlocApp(),
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
                BottomNavigationBarItem(icon: Icon(Icons.get_app, color: Colors.white), label: 'Get it'),
                BottomNavigationBarItem(icon: Icon(Icons.av_timer_outlined, color: Colors.white), label: 'BLoC'),
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
