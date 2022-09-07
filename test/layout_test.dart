// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_app/layout.dart';

void main() {
  testWidgets('should render catalog in layout by default',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: Layout(),
    ));

    expect(find.text("I am in Catalog Page"), findsOneWidget);
    expect(find.text("I am in Cart Page"), findsNothing);
    expect(find.text("I am in Wishlist Page"), findsNothing);
  });

  testWidgets(
      'should render cart widget on tap of cart icon in bottom navigation',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: Layout(),
    ));

    await tester.tap(find.byIcon(Icons.shopping_cart));
    await tester.pump();

    expect(find.text("I am in Cart Page"), findsOneWidget);
    expect(find.text("I am in Wishlist Page"), findsNothing);
    expect(find.text("I am in Catalog Page"), findsNothing);
  });

  testWidgets(
      'should render wishlist widget on tap of wishlist icon in bottom navigation',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: Layout(),
    ));

    await tester.tap(find.byIcon(Icons.monitor_heart_rounded));
    await tester.pump();

    expect(find.text("I am in Wishlist Page"), findsOneWidget);
    expect(find.text("I am in Cart Page"), findsNothing);
    expect(find.text("I am in Catalog Page"), findsNothing);
  });
}
