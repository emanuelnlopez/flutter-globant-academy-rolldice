import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rolldice/home.dart';
import 'package:rolldice/service/services.dart';

class AppObserver extends BlocObserver {
  const AppObserver();
}

void main() {
  Bloc.observer = const AppObserver();
  Injector.setupDependencies();
  runApp(const MyApp());
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

class Injector {
  static final instance = GetIt.instance;

  static void setupDependencies() {
    instance.registerSingleton<DiceService>(TwentySlidesDiceService());
    instance.registerSingleton<ApiService>(AssetFileService());
  }
}
