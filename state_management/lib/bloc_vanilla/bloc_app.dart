import 'package:flutter/material.dart';
import 'package:state_management/bloc_vanilla/views/counter_vw.dart';

class BlocVanillaApp extends StatefulWidget {
  const BlocVanillaApp({Key? key}) : super(key: key);

  @override
  _BlocVanillaAppState createState() => _BlocVanillaAppState();
}

class _BlocVanillaAppState extends State<BlocVanillaApp> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: CounterVw());
  }
}
