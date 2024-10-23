import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(lightTheme);

  static final ThemeData lightTheme = ThemeData(brightness: Brightness.light);
  static final ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
  void toggleTheme() {
    emit(state == lightTheme ? darkTheme : lightTheme);
  }
}
