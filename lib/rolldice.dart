import 'package:flutter/material.dart';
import 'bloc_logic/dicecubit.dart';

class RollDice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RollDiceState();
}

class RollDiceState extends State<RollDice> {
  final blocRandom = DiceCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/dice-${blocRandom.state}.png",
            width: 250,
          ),
          SizedBox(
            height: 30,
            width: MediaQuery.of(context).size.width,
          ),
          ElevatedButton(
            onPressed: () {
              blocRandom.randomize();
              setState(() {});
            },
            child: const Text("Random dice"),
          ),
        ],
      ),
    );
  }
}
