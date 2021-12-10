// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tthc/src/features/map/controllers/building/building_controller.dart';
import 'package:tthc/src/features/map/models/building_data.dart';
import 'package:tthc/src/features/map/utils/navigation_key.dart';

class BuildingScreen extends HookConsumerWidget {
  const BuildingScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  static const routeName = '/map/building';

  final BuildingData data;

  double tileSize(double width) {
    return (width - 24) / 4;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(buildingControllerProvider(data));
    final latestContext = ref.watch(latestContextProvider.notifier);
    useEffect(
      () {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          latestContext.state = context;
        });
      },
      [],
    );
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: LayoutBuilder(builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  SizedBox(
                    width: tileSize(constraints.maxWidth),
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int floor = 0; floor < 3; floor++)
                            Container(
                              color: Theme.of(context).colorScheme.primary,
                              height: tileSize(constraints.maxWidth),
                              width: tileSize(constraints.maxWidth),
                              child: Center(
                                child: Text(
                                  'Tầng ${3 - floor}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: controller.markerWidget(
                      context,
                      tileSize(constraints.maxWidth),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
