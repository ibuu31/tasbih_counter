import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sound_button_state.dart';

class SoundButtonCubit extends Cubit<SoundButtonState> {
  SoundButtonCubit()
      : super(const SoundButtonState(soundState: SoundEnum.soundOn));
  void toggleSoundButton() {
    if (state.soundState == SoundEnum.soundOn) {
      emit(const SoundButtonState(soundState: SoundEnum.vibrate));
    } else if (state.soundState == SoundEnum.vibrate) {
      emit(const SoundButtonState(soundState: SoundEnum.soundOff));
    } else {
      emit(const SoundButtonState(soundState: SoundEnum.soundOn));
    }
  }
}
