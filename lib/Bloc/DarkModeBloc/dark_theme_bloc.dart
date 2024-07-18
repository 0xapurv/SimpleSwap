// dark_theme_bloc.dart
import 'package:SimpleSwap/Bloc/DarkModeBloc/DarkThemePreference.dart';
import 'package:bloc/bloc.dart';
import 'dark_theme_event.dart';
import 'dark_theme_state.dart';

class DarkThemeBloc extends Bloc<DarkThemeEvent, DarkThemeState> {
  final DarkThemePreference darkThemePreference;

  DarkThemeBloc(this.darkThemePreference) : super(DarkThemeState(isDarkTheme: false)) {
    on<ToggleDarkTheme>((event, emit) {
      darkThemePreference.setDarkTheme(event.isDarkTheme);
      emit(DarkThemeState(isDarkTheme: event.isDarkTheme));
    });
  }
}
