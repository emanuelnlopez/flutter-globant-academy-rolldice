import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rolldice/accessibility/semantics_screen.dart';

void main() {
  group(
    'Semantics Screen',
    () {
      testWidgets(
        'Should be accessible',
        (WidgetTester tester) async {
          // Pump our SemanticsScreen
          await tester.pumpWidget(const MaterialApp(home: SemanticsScreen()));

          expect(
            tester.semantics.simulatedAccessibilityTraversal(),
            [
              containsSemantics(
                label: 'Semantics Example',
                isHeader: true,
              ),
              containsSemantics(label: 'Hello Semantics World!'),
              containsSemantics(
                label: 'Greeting message\nHello Semantics World!',
                hint: 'This is an example of a greeting text',
              ),
              containsSemantics(
                label: 'This is not the semantic you are looking for',
              ),
              containsSemantics(
                label: 'Important Information',
              ),
              containsSemantics(
                label: 'This icon and text will be read separately',
              ),
              containsSemantics(
                label:
                    'Important Information\nThis icon and text will be read together',
              ),
              containsSemantics(
                label: 'Button',
              ),
              containsSemantics(
                label: 'Enable new feature',
              ),
              containsSemantics(
                label: 'Element of a list\nList item subtitle',
              ),
              containsSemantics(
                value: '50%',
                isSlider: true,
                isHidden: true,
              ),
              containsSemantics(
                value: '50%',
                decreasedValue: '45%',
                increasedValue: '55%',
                isSlider: true,
                isHidden: true,
                hasEnabledState: true,
                isFocusable: true,
                isEnabled: true,
              ),
              containsSemantics(
                label: 'First',
                isButton: true,
                hasEnabledState: true,
                isEnabled: true,
                isHidden: true,
                isFocusable: true,
              ),
              containsSemantics(
                label: 'Second',
                isButton: true,
                hasEnabledState: true,
                isEnabled: true,
                isHidden: true,
                isFocusable: true,
              ),
              containsSemantics(
                label: 'Third',
                isButton: true,
                hasEnabledState: true,
                isEnabled: true,
                isHidden: true,
                isFocusable: true,
              ),
              containsSemantics(
                label: 'Dump Semantic Tree',
              ),
            ],
          );
        },
      );
    },
  );
}
