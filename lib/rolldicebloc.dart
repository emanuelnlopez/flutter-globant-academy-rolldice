import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rolldice/main.dart';

import 'bloc_logic/dicebloc.dart';
import 'bloc_logic/dicebloc_state.dart';

class RollDiceBloc extends StatelessWidget {
  const RollDiceBloc({super.key});

  @override
  Widget build(BuildContext context) {
    final injector = DependencyInjectionInheritedWidget.of(context);
    return BlocProvider(
      create: (context) => DiceBloc(service: injector.diceService),
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
                  : Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          state.currentSide.toString(),
                          style: const TextStyle(fontSize: 150.0),
                        ),
                      ),
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
