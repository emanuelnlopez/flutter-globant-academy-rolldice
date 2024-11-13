import 'package:flutter/material.dart';

class RowVsWrapScreen extends StatelessWidget {
  const RowVsWrapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Row vs Wrap')),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: <Widget>[
                Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 36.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                Icon(
                  Icons.audiotrack,
                  color: Colors.green,
                  size: 36.0,
                ),
                Icon(
                  Icons.beach_access,
                  color: Colors.blue,
                  size: 36.0,
                ),
                Text('This is some random text'),
                Icon(
                  Icons.account_circle,
                  color: Colors.orange,
                  size: 36.0,
                ),
                Icon(
                  Icons.fingerprint,
                  color: Colors.purple,
                  size: 36.0,
                ),
                Icon(
                  Icons.lightbulb_rounded,
                  color: Colors.yellow,
                  size: 36.0,
                ),
              ],
            ),
            SizedBox(height: 50),
            Wrap(
              children: <Widget>[
                Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 36.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                Icon(
                  Icons.audiotrack,
                  color: Colors.green,
                  size: 36.0,
                ),
                Icon(
                  Icons.beach_access,
                  color: Colors.blue,
                  size: 36.0,
                ),
                Text('This is some random text'),
                Icon(
                  Icons.account_circle,
                  color: Colors.orange,
                  size: 36.0,
                ),
                Icon(
                  Icons.fingerprint,
                  color: Colors.purple,
                  size: 36.0,
                ),
                Icon(
                  Icons.lightbulb_rounded,
                  color: Colors.yellow,
                  size: 36.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
