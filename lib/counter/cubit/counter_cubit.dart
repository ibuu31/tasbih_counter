import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:vibration/vibration.dart';

class CounterCubit extends Cubit<int> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool soundOn = true;
  bool vibrateOn = false;
  CounterCubit() : super(0);
  Future<void> _playSound() async {
    await audioPlayer.play(AssetSource('sound/sound.wav'));
  }

  void increment() async {
    emit(state + 1);
    if (soundOn) {
      await _playSound();
    } else if (vibrateOn) {
      await Vibration.vibrate();
      // HapticFeedback.heavyImpact();
    }
  }

  void reset() {
    emit(0);
  }
}
