import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tthc/src/features/map/controllers/building/building_list_controller.dart';

class BuildingListScreen extends ConsumerWidget {
  const BuildingListScreen({Key? key}) : super(key: key);

  static const routeName = '/building-list';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listController = ref.watch(buildingListControllerProvider);

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: listController.buildingWidgets(context, constraints),
        ),
      ),
    );
  }
}
