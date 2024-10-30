import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum DiceStatus { initial, processing, done }

class DiceStates extends Equatable {
  const DiceStates({
    this.status = DiceStatus.initial,
    this.currentSide = 1,
  });

  final DiceStatus status;
  final int currentSide;

  DiceStates copyWith({DiceStatus? stats, int? side}) {
    return DiceStates(
      status: stats ?? DiceStatus.initial,
      currentSide: side ?? 1,
    );
  }

  @override
  List<Object?> get props => [status, currentSide];
}

class DiceBloc extends Bloc<DiceStatus, DiceStates> {
  DiceBloc(super.initialState);

  Future<void> randomize() async {
    emit(state.copyWith(stats: DiceStatus.processing));

    await Future.delayed(const Duration(seconds: 2));

    final random = Random();

    emit(state.copyWith(stats: DiceStatus.done, side: random.nextInt(6) + 1));
  }
}

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
      appBar: null,
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
