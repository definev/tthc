import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tthc/src/features/map/models/building_data.dart';
import 'package:tthc/src/features/map/screens/building_list_screen.dart';
import 'package:tthc/src/features/map/screens/building_screen.dart';
import 'package:tthc/src/features/map/widgets/blink_assistant.dart';

class MapScreen extends HookWidget {
  const MapScreen({Key? key}) : super(key: key);

  static const routeName = '/map';

  @override
  Widget build(BuildContext context) {
    final navigatorKey = useMemoized(() => GlobalKey<NavigatorState>());

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
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Theme.of(context).colorScheme.onBackground,
            onPressed: () {
              if (navigatorKey.currentState?.canPop() == true) {
                navigatorKey.currentState!.pop();
              } else {
                Navigator.of(context).pop();
              }
            },
          ),

          // shadowColor: Colors.transparent,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Navigator(
                    key: navigatorKey,
                    initialRoute: BuildingListScreen.routeName,
                    onGenerateRoute: (settings) {
                      if (settings.name == BuildingScreen.routeName) {
                        final data = settings.arguments as BuildingData?;
                        return MaterialPageRoute<dynamic>(
                          builder: (context) => BuildingScreen(
                            data: data!,
                          ),
                        );
                      }
                      if (settings.name == BuildingListScreen.routeName) {
                        return MaterialPageRoute<dynamic>(
                          builder: (context) => const BuildingListScreen(),
                        );
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 200),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.1),
                      blurRadius: 20,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Chào tôi là Team17',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 80),
                    const Text('Tôi sẽ hướng dẫn bạn làm thủ tục nhanh chóng'),
                  ],
                ),
              ),
            ),
            const Positioned(
              bottom: 60,
              left: 0,
              right: 0,
              child: BlinkAssistant(),
            ),
          ],
        ),
      ),
    );
  }
}
