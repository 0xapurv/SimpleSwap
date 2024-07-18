// dark_theme_event.dart
import 'package:equatable/equatable.dart';

abstract class DarkThemeEvent extends Equatable {
  const DarkThemeEvent();

  @override
  List<Object> get props => [];
}

class ToggleDarkTheme extends DarkThemeEvent {
  final bool isDarkTheme;

  const ToggleDarkTheme(this.isDarkTheme);

  @override
  List<Object> get props => [isDarkTheme];
}
