// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:challenge4/app/app.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    // 기본 네비게이션 테스트로 변경
    expect(find.text('홈'), findsWidgets); // 상단 타이틀과 하단 탭에서 찾음
    expect(find.byIcon(CupertinoIcons.home), findsOneWidget);

    // 뉴스 탭으로 이동
    await tester.tap(find.byIcon(CupertinoIcons.news));
    await tester.pumpAndSettle();

    expect(find.text('뉴스'), findsWidgets);
  });
}
