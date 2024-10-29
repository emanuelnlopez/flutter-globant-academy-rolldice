import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class DiceCubit extends Cubit<int> {
  DiceCubit() : super(1);

  final random = Random();

  void randomize() => emit(random.nextInt(6) + 1);
}

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
