import 'package:flutter/material.dart';
import 'package:state_management/get_it/views/counter_config_vw.dart';

class CounterVw extends StatelessWidget {
  static const route = 'CounterVw';

  const CounterVw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetItApp'),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text('0', style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.1))),
            ],
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: GestureDetector(
              child: Icon(Icons.construction, size: MediaQuery.of(context).size.height * 0.04),
              onTap: () {
                Route route = MaterialPageRoute(builder: (context) => const CounterConfigVw());
                Navigator.push(context, route);
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Increase counter
        },
      ),
    );
  }
}
