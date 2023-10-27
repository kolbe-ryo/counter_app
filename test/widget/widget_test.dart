import 'package:counter_app/presentation/pages/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: MainPage())),
    );
    await tester.pumpAndSettle();
    await tester.pump();

    // Text find
    expect(find.text('Banana'), findsOneWidget);
    expect(find.text('BANANA'), findsNothing);

    // // Wait after tap
    // await tester.tap(find.byTooltip('edit'));
    // await tester.pumpAndSettle();

    // expect(find.text('EDIT'), findsOneWidget);
  });
}
