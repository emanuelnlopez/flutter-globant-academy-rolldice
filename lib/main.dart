import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:rolldice/home.dart';
import 'package:rolldice/service/services.dart';

class AppObserver extends BlocObserver {
  const AppObserver();
}

void main() {
  Bloc.observer = const AppObserver();
  runApp(
    DependencyInjectionInheritedWidget(
      diceService: TwentySlidesDiceService(),
      newsApiService: HttpApiService(),
      child: const MyApp(),
    ),
  );
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

class DependencyInjectionInheritedWidget extends InheritedWidget {
  const DependencyInjectionInheritedWidget({
    required this.diceService,
    super.key,
    required this.newsApiService,
    required super.child,
  });

  static DependencyInjectionInheritedWidget of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<
          DependencyInjectionInheritedWidget>()!;

  final ApiService newsApiService;
  final DiceService diceService;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
