import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tthc/src/features/action/screens/action_screen.dart';
import 'package:tthc/src/features/form/screens/form_screen.dart';
import 'package:tthc/src/features/location/screens/location_screen.dart';
import 'package:tthc/src/features/map/screens/map_screen.dart';
import 'package:tthc/src/features/splash_screen.dart';
import 'package:tthc/src/utils/styles.dart';

class RootApp extends ConsumerWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appStyleThemeProvider);

    return MaterialApp(
      theme: appTheme.toTheme.copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: SharedAxisPageTransitionsBuilder(
              transitionType: SharedAxisTransitionType.scaled,
            ),
          },
        ),
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        ActionScreen.routeName: (_) => const ActionScreen(),
        FormScreen.routeName: (_) => const FormScreen(),
        LocationScreen.routeName: (_) => const LocationScreen(),
        MapScreen.routeName: (_) => const MapScreen(),
        SplashScreen.routeName: (_) => const SplashScreen(),
      },
    );
  }
}
