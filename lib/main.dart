import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rolldice/home.dart';
import 'package:rolldice/service/always_one_dice_service.dart';
import 'package:rolldice/service/services.dart';

final newsApiService = Provider<ApiService>((ref) => MemoryApiService());
final diceService = Provider<DiceService>((ref) => AlwaysOneDiceService());

class AppObserver extends BlocObserver {
  const AppObserver();
}

void main() {
  Bloc.observer = const AppObserver();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roll Dice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
