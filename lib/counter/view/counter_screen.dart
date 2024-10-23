import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasbih_counter/counter/cubit/counter_cubit.dart';
import 'package:tasbih_counter/counter/cubit/sound_button_cubit/sound_button_bloc.dart';
import 'package:tasbih_counter/counter/view/counter_view.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => SoundButtonCubit(),
        ),
      ],
      child: const CounterView(),
    );
  }
}
