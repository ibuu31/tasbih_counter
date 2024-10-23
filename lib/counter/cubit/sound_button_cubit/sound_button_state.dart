part of 'sound_button_bloc.dart';

enum SoundEnum { soundOn, soundOff, vibrate }

class SoundButtonState extends Equatable {
  final SoundEnum soundState;
  const SoundButtonState({required this.soundState});
  @override
  List<Object?> get props => [soundState];
}
