import 'package:bloc/bloc.dart';
import 'package:rolldice/service/dice_service.dart';

import 'dicebloc_state.dart';

class DiceBloc extends Bloc<DiceStatus, DiceStates> {
  DiceBloc({required this.service}) : super(const DiceStates());

  final DiceService service;

  Future<void> randomize() async {
    emit(state.copyWith(stats: DiceStatus.processing));

    final side = await service.rollDice();

    emit(state.copyWith(stats: DiceStatus.done, side: side));
  }
}
