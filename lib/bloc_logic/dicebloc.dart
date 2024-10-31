import 'dart:math';

import 'package:bloc/bloc.dart';

import 'dicebloc_state.dart';

class DiceBloc extends Bloc<DiceStatus, DiceStates> {
  DiceBloc(super.initialState);

  Future<void> randomize() async {
    emit(state.copyWith(stats: DiceStatus.processing));

    await Future.delayed(const Duration(milliseconds: 300));

    final random = Random();

    emit(state.copyWith(stats: DiceStatus.done, side: random.nextInt(6) + 1));
  }
}
