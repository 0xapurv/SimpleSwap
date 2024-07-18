// dark_theme_state.dart
import 'package:equatable/equatable.dart';

class DarkThemeState extends Equatable {
  final bool isDarkTheme;

  const DarkThemeState({required this.isDarkTheme});

  @override
  List<Object> get props => [isDarkTheme];
}
