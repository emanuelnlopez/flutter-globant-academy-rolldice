import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_logic/dicebloc.dart';
import 'bloc_logic/dicebloc_state.dart';

class RollDiceBloc extends StatelessWidget {
  const RollDiceBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiceBloc(const DiceStates()),
      child: const RollDiceView(),
    );
  }
}

class RollDiceView extends StatelessWidget {
  const RollDiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<DiceBloc, DiceStates>(
            builder: (context, state) {
              return state.status == DiceStatus.processing
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Image.asset(
                      "assets/dice-${state.currentSide}.png",
                      width: 250,
                    );
            },
          ),
          SizedBox(
            height: 30,
            width: MediaQuery.of(context).size.width,
          ),
          ElevatedButton(
            onPressed: () => context.read<DiceBloc>().randomize(),
            child: const Text("Random dice"),
          ),
        ],
      ),
    );
  }
}
