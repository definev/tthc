import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appStyleThemeProvider =
    StateNotifierProvider<AppStyle, FlexColorScheme>((ref) => AppStyle());

class AppStyle extends StateNotifier<FlexColorScheme> {
  AppStyle() : super(FlexColorScheme.light());

  void switchTheme() {
    state = state.brightness == Brightness.light
        ? FlexColorScheme.dark()
        : FlexColorScheme.light();
  }
}
