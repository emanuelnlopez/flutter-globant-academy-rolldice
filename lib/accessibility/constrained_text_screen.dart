import 'package:flutter/material.dart';

class ConstrainedTextScreen extends StatelessWidget {
  const ConstrainedTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Constrained Text')),
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 210.0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://picsum.photos/id/237/300/150',
                      semanticLabel: 'Black Labrador breed dog',
                    ),
                    const SizedBox(height: 12.0),
                    const Text('Picture of a Black Labrador'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://picsum.photos/id/237/300/150',
                      semanticLabel: 'Black Labrador breed dog',
                    ),
                    const SizedBox(height: 12.0),
                    const Text('Picture of a Black Labrador'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
