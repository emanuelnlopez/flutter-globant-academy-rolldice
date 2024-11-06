import 'package:rolldice/service/dice_service.dart';

class AlwaysOneDiceService implements DiceService {
  @override
  Future<int> rollDice() async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    return 1;
  }
}