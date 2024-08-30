import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode themeMode) => emit(themeMode);

  @override
  ThemeMode fromJson(Map<String, dynamic> json) {
    // Convert the saved JSON data back to a ThemeMode
    final themeModeIndex = json['themeMode'] as int?;
    if (themeModeIndex != null) {
      return ThemeMode.values[themeModeIndex];
    }
    return ThemeMode.system;
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    // Convert the ThemeMode to JSON format
    return {'themeMode': state.index};
  }
}
