// test/widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myodaapp/main.dart';  // Import the main app for testing

void main() {
  group('Counter increments smoke test', () {
    testWidgets('Counter increments when button is pressed', (WidgetTester tester) async {
      // Build the widget by pumping the widget tree
      await tester.pumpWidget(MyApp());

      // Wait for all animations and widgets to settle
      await tester.pumpAndSettle();

      // Verify the initial counter value is 0
      expect(find.text('0'), findsOneWidget);

      // Tap the increment button
      await tester.tap(find.byIcon(Icons.add));  // Finds the Icon widget by its icon
      await tester.pump();  // Rebuild the widget tree after the tap

      // Verify that the counter increments to 1
      expect(find.text('1'), findsOneWidget);
    });
  });
}
