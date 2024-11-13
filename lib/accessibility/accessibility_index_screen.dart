import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rolldice/accessibility/accessible_dice_screen.dart';
import 'package:rolldice/accessibility/block_semantics_screen.dart';
import 'package:rolldice/accessibility/checkbox_screen.dart';
import 'package:rolldice/accessibility/color_blindness_screen.dart';
import 'package:rolldice/accessibility/constrained_text_screen.dart';
import 'package:rolldice/accessibility/date_time_picker_screen.dart';
import 'package:rolldice/accessibility/row_vs_wrap_screen.dart';
import 'package:rolldice/accessibility/semantics_screen.dart';
import 'package:rolldice/bloc_logic/dicebloc.dart';
import 'package:rolldice/service/services.dart';

class AccessibilityIndexScreen extends StatelessWidget {
  const AccessibilityIndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accessibility Examples')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.text_fields),
                    title: const Text('Text in constrained layouts'),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ConstrainedTextScreen(),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.list),
                    title: const Text('Row vs Wrap'),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RowVsWrapScreen(),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.color_lens),
                    title: const Text('Color Blindness Test'),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ColorBlindnessScreen(),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.check_box_outlined),
                    title: const Text('Checkbox Accessibility'),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CheckboxScreen(),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.date_range),
                    title: const Text('Date & Time picker'),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DateTimePickerScreen(),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.volume_up),
                    title: const Text('Semantics widgets examples'),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SemanticsScreen(),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.volume_up),
                    title: const Text('BlockSemantics example'),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BlockSemanticsScreen(),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.games),
                    title: const Text('Semantic Dice'),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => DiceBloc(
                            service: SixSlidesDiceService(),
                          ),
                          child: const AccessibleDiceScreen(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 1.0,
            height: 1.0,
          ),
          ListTile(
            leading: const Icon(Icons.search),
            subtitle: const Text('Text Scale Factor'),
            title: Text(MediaQuery.textScaleFactorOf(context).toString()),
          ),
        ],
      ),
    );
  }
}
