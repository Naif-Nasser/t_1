import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:t_1/main.dart';

void main() {
  testWidgets('App loads and shows home screen', (WidgetTester tester) async {
    // شغل التطبيق
    await tester.pumpWidget(const PerfumeApp());

    // انتظر تحميل الواجهات
    await tester.pumpAndSettle();

    // تحقق أن التطبيق اشتغل وظهرت كلمة Perfume Store
    expect(find.text('Perfume Store'), findsOneWidget);
  });
}
