import 'package:flutter/material.dart';

class BlockSemanticsScreen extends StatefulWidget {
  const BlockSemanticsScreen({super.key});

  @override
  State<BlockSemanticsScreen> createState() => _BlockSemanticsScreenState();
}

class _BlockSemanticsScreenState extends State<BlockSemanticsScreen> {
  bool _isModalVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BlockSemantics Example')),
      body: Stack(
        children: [
          // Main content
          Semantics(
            label: 'Main content',
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('This is the main content'),
                ElevatedButton(
                  onPressed: () => setState(() => _isModalVisible = true),
                  child: const Text('Open Modal'),
                ),
              ],
            ),
          ),

          // Modal overlay with BlockSemantics
          if (_isModalVisible)
            BlockSemantics(
              blocking: true, // This will block main content semantics
              child: Semantics(
                label: 'Modal dialog',
                child: AlertDialog(
                  title: const Text('Modal Title'),
                  content: const Text('Modal Content'),
                  actions: [
                    TextButton(
                      onPressed: () => setState(() => _isModalVisible = false),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
