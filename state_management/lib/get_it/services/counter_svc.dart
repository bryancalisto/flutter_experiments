import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:state_management/get_it/models/counter.dart';
import 'package:state_management/get_it/services/locator.dart';

class CounterNotifier extends ValueNotifier {
  CounterNotifier(value) : super(value);

  /*Increases the app's counter according to configurations */
  void increaseCounter() {
    int count = locator<Counter>().count;
    final start = locator<Counter>().start;
    final end = locator<Counter>().end;
    final step = locator<Counter>().step;

    // Count circularly
    count += step;
    if (count > end) {
      count++;
    }
    count = max(count % (end + 1), start);
    locator<Counter>().count = count;
    notifyListeners();
  }

  /*Saves the configurations the user made */
  void saveCounterConfig(int start, int end, int step) {
    locator<Counter>().start = start;
    locator<Counter>().end = end;
    locator<Counter>().step = step;
    locator<Counter>().count = max(start, locator<Counter>().count);
    notifyListeners();
  }
}

// class CounterManager{
//   final Counter counter;
//   final CounterNotifier counterNotifier;
// }

final counterNotifier = CounterNotifier(0);
