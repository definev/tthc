import 'package:flutter/widgets.dart';
import 'package:tthc/src/features/map/models/building_data.dart';

class BuildingController {
  const BuildingController(
    this.mapHeight,
    this.mapWidth,
    this.buildings,
  );

  final List<BuildingBase> buildings;

  final int mapHeight;
  final int mapWidth;
}

extension DataToWidget on BuildingBase {
  Widget toWidget(
    BuildContext context,
    BuildingController controller,
  ) {
    if (this is BuildingData) {
      // TODO: implement Building widget
      return const SizedBox();
    } else if (this is BuildingArrowData) {
      // TODO: implement BuildingArrow widget
      return const SizedBox();
    } else {
      // TODO: implement BuildingSpacing widget
      return const SizedBox();
    }
  }
}
