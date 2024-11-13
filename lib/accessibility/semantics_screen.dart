import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SemanticsScreen extends StatefulWidget {
  const SemanticsScreen({super.key});

  @override
  State<SemanticsScreen> createState() => _SemanticsScreenState();
}

class _SemanticsScreenState extends State<SemanticsScreen> {
  bool _isOn = false;
  double _sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Semantics Example')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Example of Semantics widget with label and hint
            Text(
              'Hello Semantics World!',
              style: textTheme.headlineMedium,
            ),
            const SizedBox(height: 50.0),

            Semantics(
              label: 'Greeting message',
              hint: 'This is an example of a greeting text',
              child: Text(
                'Hello Semantics World!',
                style: textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 50.0),

            // Example of ExcludeSemantics
            ExcludeSemantics(
              child: Text(
                'This text will be ignored',
                style: textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 50.0),

            // Example of Semantics and ExcludeSemantics
            Semantics(
              label: 'This is not the semantic you are looking for',
              excludeSemantics: true,
              child: Text(
                'Will this text be ignored?',
                style: textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 50.0),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.info,
                  semanticLabel: 'Important Information',
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    'This icon and text will be read separately',
                    style: textTheme.headlineMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50.0),

            // Example of MergeSemantics
            MergeSemantics(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.info,
                    semanticLabel: 'Important Information',
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      'This icon and text will be read together',
                      style: textTheme.headlineMedium,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50.0),

            // Example of Semantic properties on a button
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Button pressed!'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
              ),
              child: const Text('Button'),
            ),
            const SizedBox(height: 50.0),

            // Example of custom Semantics for a toggle button
            SwitchListTile(
              title: const Text('Enable new feature'),
              value: _isOn,
              onChanged: (bool value) {
                setState(() {
                  _isOn = value;
                });
              },
            ),
            const SizedBox(height: 50.0),

            const ListTile(
              subtitle: Text('List item subtitle'),
              title: Text('Element of a list'),
              trailing: Icon(Icons.chevron_right),
            ),
            const SizedBox(height: 50.0),

            // Example of Semantics with a slider
            Semantics(
              slider: true,
              value: '${(_sliderValue * 100).round()}%',
              child: Slider(
                value: _sliderValue,
                onChanged: (double value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 50.0),

            // Example of OrdinalSortKey for custom traversal order
            Wrap(
              spacing: 8.0,
              children: [
                Semantics(
                  sortKey: const OrdinalSortKey(2),
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Second button pressed!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    child: const Text('Second'),
                  ),
                ),
                Semantics(
                  sortKey: const OrdinalSortKey(1),
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('First button pressed!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    child: const Text('First'),
                  ),
                ),
                Semantics(
                  sortKey: const OrdinalSortKey(3),
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Third button pressed!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    child: const Text('Third'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50.0),

            // Image.network(
            //   'https://picsum.photos/id/237/300/150',
            //   semanticLabel: 'Black Labrador breed dog',
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugDumpSemanticsTree();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Semantic tree dumped on terminal!'),
              backgroundColor: Colors.green,
            ),
          );
        },
        child: const Icon(
          Icons.accessibility,
          semanticLabel: 'Dump Semantic Tree',
        ),
      ),
    );
  }
}
