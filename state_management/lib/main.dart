import 'package:flutter/material.dart';
import 'package:state_management/bloc/app.dart';
import 'package:state_management/bloc_vanilla/bloc_app.dart';
import 'package:state_management/get_it/get_it_app.dart';
import 'package:state_management/get_it/services/locator.dart';

void main() {
  initLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentViewIndex = 0;
  final List<Widget> _tabsContent = [
    const GetItApp(),
    const BlocVanillaApp(),
    BlocApp(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: const Color(0xff091833),
        colorScheme: const ColorScheme(
          background: Color(0xff091833),
          primary: Color(0xff711c91),
          onPrimary: Color(0xffea00d9),
          secondary: Color(0xff711c91),
          onSecondary: Color(0xffea00d9),
          brightness: Brightness.light,
          error: Colors.yellow,
          onBackground: Color(0xffea00d9),
          onError: Color(0xff091833),
          surface: Color(0xffea00d9),
          onSurface: Color(0xff0abdc6),
          primaryVariant: Color(0xff711c91),
          secondaryVariant: Color(0xff711c91),
        ),
      ),
      home: DefaultTabController(
        length: _tabsContent.length,
        child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.black,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.get_app, color: Colors.white), label: 'Get it'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.av_timer_outlined, color: Colors.white),
                  label: 'BLoC vanilla',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.av_timer_outlined, color: Colors.white),
                  label: 'BLoC package / RxDart',
                ),
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
