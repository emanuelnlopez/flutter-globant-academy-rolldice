import 'package:flutter/material.dart';
import 'package:rolldice/news.dart';
import 'package:rolldice/rolldicebloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            margin: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RollDiceBloc(),
                    ));
              },
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.gamepad_outlined),
                    Text("Roll Dice"),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewsScreen(),
                    ));
              },
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.account_balance),
                    Text("Requests"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
