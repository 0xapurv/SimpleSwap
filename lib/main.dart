// main.dart
import 'package:SimpleSwap/Bloc/DarkModeBloc/DarkThemePreference.dart';
import 'package:SimpleSwap/Bloc/DarkModeBloc/dark_theme_bloc.dart';
import 'package:SimpleSwap/Bloc/DarkModeBloc/dark_theme_event.dart';
import 'package:SimpleSwap/Bloc/DarkModeBloc/dark_theme_state.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_strategy/url_strategy.dart';

import 'Screens/review_swap_screen.dart';
import 'helpers/routes.dart';
import 'Styles/Styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  if (kIsWeb) MetaSEO();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  late DarkThemeBloc darkThemeBloc;

  @override
  void initState() {
    super.initState();
    darkThemeBloc = DarkThemeBloc(darkThemePreference);
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    bool isDarkTheme = await darkThemePreference.getTheme();
    darkThemeBloc.add(ToggleDarkTheme(isDarkTheme));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => darkThemeBloc,
      child: BlocBuilder<DarkThemeBloc, DarkThemeState>(
        builder: (context, state) {
          return MaterialApp(
            shortcuts: {
              LogicalKeySet(LogicalKeyboardKey.space): ActivateIntent(),
            },
            navigatorObservers: [FlutterSmartDialog.observer],
            builder: FlutterSmartDialog.init(),
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(state.isDarkTheme, context),
            initialRoute: Routes.home,
            onGenerateRoute: (RouteSettings settings) {
              return Routes.fadeThrough(settings, (context) {
                if (settings.name == Routes.home) {
                  return Review_Swap_Screen();
                }
                return Center(child: CircularProgressIndicator());
              });
            },
          );
        },
      ),
    );
  }
}

void snack(String s, BuildContext context) {
  SmartDialog.showToast(s, displayTime: Duration(seconds: 1), alignment: Alignment.center);
}

void snacklong(String s) {
  SmartDialog.showToast(s, displayTime: Duration(seconds: 7), alignment: Alignment.bottomCenter);
}

void snackINS(BuildContext context) {
  SmartDialog.showToast("Only PREMIUM members can make this request", displayTime: Duration(seconds: 3), alignment: Alignment.center);
}

void snackxxx(String s, BuildContext context) {
  SmartDialog.showToast(s, alignment: Alignment.center);
}

void snacklen(String s, BuildContext context) {
  SmartDialog.showToast(s, displayTime: Duration(seconds: 2), alignment: Alignment.center);
}

void snacklenx(String s, BuildContext context) {
  SmartDialog.showToast(s, displayTime: Duration(seconds: 5), alignment: Alignment.center);
}
