import 'dart:math';

import 'package:rolldice/service/dice_service.dart';

class NSlicesDiceService implements DiceService {
  final random = Random();

  NSlicesDiceService({required this.numberOfSlides});

  final int numberOfSlides;

  @override
  Future<int> rollDice() async {
    await Future.delayed(const Duration(seconds: 1));

    return random.nextInt(numberOfSlides) + 1;
  }
}
