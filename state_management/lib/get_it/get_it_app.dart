import 'package:flutter/material.dart';
import 'package:state_management/get_it/views/counter_config_vw.dart';
import 'package:state_management/get_it/views/counter_vw.dart';

Map<String, dynamic> routes = {
  CounterVw.route: (context) => const CounterVw(),
  CounterConfigVw.route: (context) => const CounterConfigVw(),
};

class GetItApp extends StatefulWidget {
  const GetItApp({Key? key}) : super(key: key);

  @override
  _GetItAppState createState() => _GetItAppState();
}

class _GetItAppState extends State<GetItApp> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: CounterVw());
  }
}
