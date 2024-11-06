import 'package:bloc/bloc.dart';
import 'package:rolldice/service/dice_service.dart';
import 'package:rolldice/service/six_slides_dice_service.dart';

import 'dicebloc_state.dart';

class DiceBloc extends Bloc<DiceStatus, DiceStates> {
  DiceBloc(super.initialState);

  DiceService service = SixSlidesDiceService();

  Future<void> randomize() async {
    emit(state.copyWith(stats: DiceStatus.processing));
    
    final side = await service.rollDice();
    
    emit(state.copyWith(stats: DiceStatus.done, side: side));
  }
}
