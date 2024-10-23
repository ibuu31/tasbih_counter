import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasbih_counter/counter/cubit/theme_cubit.dart';
import 'package:tasbih_counter/counter/view/counter_screen.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(brightness: state.brightness),
            home: const CounterScreen(),
          );
        },
      ),
    );
  }
}
