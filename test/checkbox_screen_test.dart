import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rolldice/accessibility/checkbox_screen.dart';

void main() {
  group(
    'Semantics Screen',
    () {
      testWidgets(
        'Should meet accessibility guidelines',
        (WidgetTester tester) async {
          // Pump our SemanticsScreen
          await tester.pumpWidget(const MaterialApp(home: CheckboxScreen()));

          final SemanticsHandle handle = tester.ensureSemantics();

          await expectLater(
            tester,
            meetsGuideline(androidTapTargetGuideline),
          );
          await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
          await expectLater(tester, meetsGuideline(textContrastGuideline));

          handle.dispose();
        },
      );
    },
  );
}
