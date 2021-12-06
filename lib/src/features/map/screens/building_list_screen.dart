import 'package:flutter/material.dart';
import 'package:tthc/src/features/map/controllers/building_controller.dart';

class BuildingListScreen extends StatelessWidget {
  const BuildingListScreen({Key? key}) : super(key: key);

  static const routeName = '/building-list';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: oneBuildingController.buildingWidgets,
    );
  }
}
