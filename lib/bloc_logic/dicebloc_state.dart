import 'package:equatable/equatable.dart';

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
