import 'package:flutter/material.dart';

class BlocApp extends StatefulWidget {
  const BlocApp({Key? key}) : super(key: key);

  @override
  _BlocAppState createState() => _BlocAppState();
}

class _BlocAppState extends State<BlocApp> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('BlocApp'),
    );
  }
}
