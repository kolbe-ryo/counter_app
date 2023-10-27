import 'package:counter_app/presentation/pages/other/other_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: OtherPage(),
      ),
    );

    // Text find
    expect(find.text('About App'), findsWidgets);
    // expect(find.text('1'), findsNothing);

    // // Wait after tap
    // await tester.tap(find.byTooltip('edit'));
    // await tester.pumpAndSettle();

    // expect(find.text('EDIT'), findsOneWidget);
  });
}
