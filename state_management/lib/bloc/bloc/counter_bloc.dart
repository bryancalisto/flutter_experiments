import 'dart:async';
import 'dart:math';
import 'package:state_management/bloc/models/counter.dart';

abstract class Bloc {
  void dispose();
}

class CounterBloc implements Bloc {
  final Counter _counter = Counter(count: 0, start: 0, end: 4, step: 1);
  final streamCtl = StreamController<Counter>.broadcast();

  Counter get counter => _counter;

  CounterBloc() {
    streamCtl.onListen = () {
      streamCtl.sink.add(_counter);
    };
  }

  void increaseCounter() {
    // Count circularly
    _counter.count += _counter.step;

    if (_counter.count > _counter.end) {
      _counter.count++;
    }

    _counter.count = max(_counter.count % (_counter.end + 1), _counter.start);
    streamCtl.sink.add(_counter);
  }

  /*Saves the configurations the user made */
  void saveCounterConfig(int start, int end, int step) {
    _counter.start = start;
    _counter.end = end;
    _counter.step = step;
    _counter.count = max(start, _counter.count);
    streamCtl.sink.add(_counter);
  }

  @override
  void dispose() {
    streamCtl.close();
  }
}

final counterBloc = CounterBloc();
