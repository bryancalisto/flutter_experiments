import 'package:flutter_test/flutter_test.dart';
import 'package:state_management/main.dart';

void main() {
  const widgetToTest = MyApp();
  group('TabView navigation should work', () {
    testWidgets('App should render GetItApp when "Get it" btn is pressed', (WidgetTester tester) async {
      await tester.pumpWidget(widgetToTest);
      await tester.tap(find.text('Get it'));
      await tester.pump();
      expect(find.text('GetItApp'), findsOneWidget);
    });

    testWidgets('App should render BlocApp when "BLoC" btn is pressed', (WidgetTester tester) async {
      // await tester.pumpWidget(const MyApp());
      await tester.pumpWidget(widgetToTest);
      await tester.tap(find.text('BLoC'));
      await tester.pump();
      expect(find.text('BlocApp'), findsOneWidget);
    });
  });
}
