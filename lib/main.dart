import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:rolldice/home.dart';

class AppObserver extends BlocObserver {
  const AppObserver();
}

void main() {
  Bloc.observer = const AppObserver();
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
