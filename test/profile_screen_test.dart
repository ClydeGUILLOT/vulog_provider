import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/views/profile.dart';

void main() {
  Widget makeThisTestable({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }
  testWidgets('', (WidgetTester tester) async {
    ProfileScreen page = const ProfileScreen();

    await tester.pumpWidget(makeThisTestable(child: page));
  });
}