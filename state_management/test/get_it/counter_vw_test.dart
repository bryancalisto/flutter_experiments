import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:state_management/get_it/services/counter_svc.dart';
import 'package:state_management/get_it/services/locator.dart';
import 'package:state_management/get_it/views/counter_vw.dart';

void main() {
  const widgetToTest = MaterialApp(home: CounterVw());

  setUp(() async {
    await locator.reset();
    initLocator();
  });
  group('Counter works fine', () {
    testWidgets('Counter should increase according to the step parameter', (WidgetTester tester) async {
      // ARRANGE
      await tester.pumpWidget(widgetToTest);
      counterNotifier.saveCounterConfig(2, 7, 2);
      // ACT
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();
      //ASSERT
      expect(find.text('4'), findsOneWidget);
    });

    testWidgets('Circular counter should work fine', (WidgetTester tester) async {
      // ARRANGE
      await tester.pumpWidget(widgetToTest);
      counterNotifier.saveCounterConfig(0, 7, 9); // Next increase should move count to 2
      // ACT
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();
      //ASSERT
      expect(find.text('2'), findsOneWidget);
    });
    testWidgets('Counter should start according to the start parameter', (WidgetTester tester) async {
      // ARRANGE
      await tester.pumpWidget(widgetToTest);
      counterNotifier.saveCounterConfig(0, 7, 9);
      counterNotifier.saveCounterConfig(5, 7, 9);
      // ACT
      await tester.pump();
      //ASSERT
      expect(find.text('5'), findsOneWidget);
    });

    testWidgets('Counter should end according to the end parameter', (WidgetTester tester) async {
      // ARRANGE
      await tester.pumpWidget(widgetToTest);
      counterNotifier.saveCounterConfig(2, 3, 1);
      // ACT
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();
      //ASSERT
      expect(find.text('3'), findsOneWidget);
    });
  });
}
