import 'package:get_it/get_it.dart';
import 'package:state_management/get_it/models/counter.dart';

GetIt locator = GetIt.I;

void initLocator() {
  locator.registerLazySingleton<Counter>(() => Counter(count: 0, start: 0, end: 7, step: 1));
}
