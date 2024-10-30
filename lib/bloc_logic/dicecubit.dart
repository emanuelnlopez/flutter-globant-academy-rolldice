import 'dart:math';

import 'package:bloc/bloc.dart';

class DiceCubit extends Cubit<int> {
  DiceCubit() : super(1);

  final random = Random();

  void randomize() => emit(random.nextInt(6) + 1);
}
