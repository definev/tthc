import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tthc/src/features/map/controllers/blink_assistant_controller.dart';
import 'package:tthc/src/features/map/controllers/building/building_list_controller.dart';
import 'package:tthc/src/features/map/models/action_data.dart';
import 'package:tthc/src/features/map/screens/map_screen.dart';
import 'package:tthc/src/features/map/screens/page_step/welcome_step.dart';
import 'package:tthc/src/features/map/widgets/blink_assistant.dart';
import 'package:tthc/src/utils/styles.dart';

void main() {
  group('Map test with one building usecase', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets(
      'initial screen',
      (tester) async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              buildingListControllerProvider
                  .overrideWithValue(oneBuildingListController),
              actionDataProvider.overrideWithValue(
                StateController(identifyActionDataUsecase),
              ),
            ],
            child: Consumer(
              builder: (context, ref, child) {
                final appTheme = ref.watch(appStyleThemeProvider);

                return MaterialApp(
                  theme: appTheme.toTheme.copyWith(
                    pageTransitionsTheme: const PageTransitionsTheme(
                      builders: <TargetPlatform, PageTransitionsBuilder>{
                        TargetPlatform.android:
                            SharedAxisPageTransitionsBuilder(
                          transitionType: SharedAxisTransitionType.scaled,
                        ),
                      },
                    ),
                  ),
                  initialRoute: MapScreen.routeName,
                  routes: {
                    MapScreen.routeName: (_) => const MapScreen(),
                  },
                );
              },
            ),
          ),
        );

        await tester.pump(const Duration(seconds: 1));
        final assistant = find.byType(BlinkAssistant).first;
        expect(find.byType(WelcomeStep), findsOneWidget);

        await tester.tap(assistant);
        await tester.pump(const Duration(seconds: 1));

        // STEP 1
        final titleStep1 = find.byKey(const ValueKey('title_1')).first;
        final descriptionStep1 =
            find.byKey(const ValueKey('description_1')).first;
        expect(titleStep1, findsOneWidget);
        expect(descriptionStep1, findsOneWidget);

        // STEP 2
        await tester.tap(assistant);
        await tester.pump(const Duration(seconds: 2));
        final titleStep2 = find.byKey(const ValueKey('title_2')).first;
        final descriptionStep2 =
            find.byKey(const ValueKey('description_2')).first;
        expect(titleStep2, findsOneWidget);
        expect(descriptionStep2, findsOneWidget);
        expect(find.byType(StaggeredGridView), findsOneWidget);

      },
    );
  });
}
