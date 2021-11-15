import 'package:flutter/material.dart';
import 'package:state_management/bloc_vanilla/bloc/counter_bloc.dart';
import 'package:state_management/bloc_vanilla/models/counter.dart';
import 'package:state_management/bloc_vanilla/views/counter_config_vw.dart';

class CounterVw extends StatefulWidget {
  static const route = 'CounterVw';

  const CounterVw({Key? key}) : super(key: key);

  @override
  State<CounterVw> createState() => _CounterVwState();
}

class _CounterVwState extends State<CounterVw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlocApp'),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<Counter>(
                stream: counterBloc.streamCtl.stream,
                builder: (context, snapshot) {
                  // Snapshot always will have data
                  if (snapshot.hasData) {
                    return Center(
                      child: Text(
                        snapshot.data!.count.toString(),
                        style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.1),
                      ),
                    );
                  }

                  return Container();
                },
              ),
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
        onPressed: () => counterBloc.increaseCounter(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
