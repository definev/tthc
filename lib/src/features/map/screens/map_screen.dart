import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tthc/src/features/map/controllers/blink_assistant_controller.dart';
import 'package:tthc/src/features/map/models/building_data.dart';
import 'package:tthc/src/features/map/screens/building_list_screen.dart';
import 'package:tthc/src/features/map/screens/building_screen.dart';
import 'package:tthc/src/features/map/screens/page_step/step_builder.dart';
import 'package:tthc/src/features/map/utils/navigation_key.dart';
import 'package:tthc/src/features/map/widgets/blink_assistant.dart';
import 'package:tthc/src/utils/durations.dart';

class MapScreen extends HookConsumerWidget {
  const MapScreen({Key? key}) : super(key: key);

  static const routeName = '/map';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assistantController = ref.watch(blinkAssistantControllerProvider);
    final navigatorKey = ref.watch(navigatorKeyProvider);
    final mq = MediaQuery.of(context);

    useEffect(
      () {
        WidgetsBinding.instance!.addPostFrameCallback(
          (_) {
            assistantController.addInitPosition(
              Offset(
                (mq.size.width - 80) / 2,
                mq.size.height - mq.padding.bottom - mq.padding.top - 90,
              ),
            );
          },
        );
      },
      [],
    );

    return WillPopScope(
      onWillPop: () async {
        if (navigatorKey.currentState?.canPop() == true) {
          navigatorKey.currentState!.pop();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Navigator(
                    key: navigatorKey,
                    initialRoute: BuildingListScreen.routeName,
                    onGenerateRoute: (settings) {
                      if (settings.name == BuildingListScreen.routeName) {
                        return MaterialPageRoute<dynamic>(
                          builder: (context) => const BuildingListScreen(),
                        );
                      }
                      if (settings.name == BuildingScreen.routeName) {
                        final data = settings.arguments as BuildingData?;

                        return MaterialPageRoute<dynamic>(
                          settings: RouteSettings(
                            name: 'b:${data?.name}',
                            arguments: data,
                          ),
                          builder: (context) => BuildingScreen(data: data!),
                        );
                      }

                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 200),
              ],
            ),
            if (assistantController.currentStep == 0)
              ColoredBox(
                color: Colors.transparent,
                child: SizedBox(
                  height: mq.size.height,
                  width: mq.size.width,
                ),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: StepBuilder(navigatorKey: navigatorKey),
            ),
            if (assistantController.isInit)
              AnimatedPositioned(
                duration: Durations.kMedium.duration,
                curve: Curves.easeInOut,
                left: assistantController.currentAssistantPos.dx,
                top: assistantController.currentAssistantPos.dy,
                child: const BlinkAssistant(),
              ),
          ],
        ),
      ),
    );
  }
}
