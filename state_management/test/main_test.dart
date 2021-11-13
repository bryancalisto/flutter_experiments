import 'package:flutter_test/flutter_test.dart';
import 'package:state_management/get_it/services/locator.dart';
import 'package:state_management/main.dart';

void main() {
  const widgetToTest = MyApp();
  setUpAll(() => initLocator());
  group('TabView navigation should work', () {
    testWidgets('App should render GetItApp when "Get it" btn is pressed', (WidgetTester tester) async {
      //ARRANGE
      await tester.pumpWidget(widgetToTest);
      //ACT
      await tester.tap(find.text('Get it'));
      await tester.pump();
      //ASSERT
      expect(find.text('GetItApp'), findsOneWidget);
    });

    testWidgets('App should render BlocApp when "BLoC" btn is pressed', (WidgetTester tester) async {
      //ARRANGE
      await tester.pumpWidget(widgetToTest);
      //ACT
      await tester.tap(find.text('BLoC'));
      await tester.pump();
      //ASSERT
      expect(find.text('BlocApp'), findsOneWidget);
    });
  });
}
