import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasbih_counter/counter/cubit/counter_cubit.dart';
import 'package:tasbih_counter/counter/cubit/sound_button_cubit/sound_button_bloc.dart';
import 'package:tasbih_counter/counter/cubit/theme_cubit.dart';
import 'package:tasbih_counter/counter/widgets.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Tasbih Counter'),
          backgroundColor: Colors.teal,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CommonButtons(
                  icon: Icons.refresh,
                  onTap: () {
                    context.read<CounterCubit>().reset();
                  },
                ),
                BlocConsumer<SoundButtonCubit, SoundButtonState>(
                  listener: (context, state) {
                    if (state.soundState == SoundEnum.soundOn) {
                      context.read<CounterCubit>().soundOn = true;
                      context.read<CounterCubit>().vibrateOn = false;
                    } else if (state.soundState == SoundEnum.vibrate) {
                      context.read<CounterCubit>().vibrateOn = true;
                      context.read<CounterCubit>().soundOn = false;
                    } else {
                      context.read<CounterCubit>().soundOn = false;
                      context.read<CounterCubit>().vibrateOn = false;
                    }
                  },
                  builder: (context, state) {
                    return CommonButtons(
                      icon: state.soundState == SoundEnum.soundOff
                          ? Icons.volume_off
                          : state.soundState == SoundEnum.vibrate
                              ? Icons.vibration
                              : Icons.volume_up,
                      onTap: () {
                        context.read<SoundButtonCubit>().toggleSoundButton();
                      },
                    );
                  },
                ),
                BlocBuilder<ThemeCubit, ThemeData>(
                  builder: (context, state) {
                    return CommonButtons(
                      icon: state.brightness == Brightness.light
                          ? Icons.dark_mode
                          : Icons.light_mode_outlined,
                      onTap: () {
                        context.read<ThemeCubit>().toggleTheme();
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 40),
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Text(
                  '$state',
                  style: const TextStyle(
                      fontSize: 48, fontWeight: FontWeight.bold),
                );
              },
            ),
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Center(
                child: GestureDetector(
                  onTap: () async {
                    context.read<CounterCubit>().increment();
                  },
                  child: Container(
                    width: 225,
                    height: 225,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.teal.withOpacity(0.5), // Border color
                        width: 20, // Border thickness
                      ),
                      borderRadius: BorderRadius.circular(120),
                    ),
                    child: const Center(
                      child: Text(
                        'Tap Here',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
