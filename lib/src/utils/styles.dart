import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

export './durations.dart';

final appStyleThemeProvider =
    StateNotifierProvider<AppStyle, FlexColorScheme>((ref) => AppStyle());

class AppStyle extends StateNotifier<FlexColorScheme> {
  AppStyle()
      : super(
          FlexColorScheme.light(
            scheme: FlexScheme.bigStone,
            // We use a surface color mode where all Material surfaces use
            // the same primary color branding, but scaffold background
            // uses much less.
            surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
            // We set the blend level strength to 20.
            blendLevel: 10,
            appBarElevation: 0.5,
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
          ),
        );

  void switchTheme() {
    state = state.brightness == Brightness.light
        ? FlexColorScheme.dark(
            // We use a surface color mode where all Material surfaces use
            // the same primary color branding, but scaffold background
            // uses much less.
            surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
            // We set the blend level strength to 20.
            blendLevel: 20,
            appBarElevation: 0.5,
            darkIsTrueBlack: true,
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
          )
        : FlexColorScheme.light(
            // We use a surface color mode where all Material surfaces use
            // the same primary color branding, but scaffold background
            // uses much less.
            surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
            // We set the blend level strength to 20.
            blendLevel: 20,
            appBarElevation: 0.5,
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
          );
  }
}
