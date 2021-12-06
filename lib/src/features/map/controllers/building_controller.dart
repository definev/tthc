import 'package:flutter/widgets.dart';
import 'package:tthc/src/features/map/models/building_data.dart';
import 'package:tthc/src/features/map/widgets/building.dart';
import 'package:tthc/src/features/map/widgets/building_arrow.dart';
import 'package:tthc/src/utils/durations.dart';

/// BẢN ĐỒ VÍ DỤ VỀ HAI TÒA NHÀ (6 x 6)
///
/// --------------------_____________________--------------------
/// |         |         |     Cổng vào      |         |         |
/// |         |         |                   |         |         |
/// --------------------‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾--------------------
/// |         |         |         |         |         |         |
/// |         |         |         |         |         |         |
/// _____________________-------------------_____________________
/// |                   |         |         |                   |
/// |                   |         |         |                   |
/// |       Tòa A       |-------------------|       Tòa B       |
/// |                   |         |         |                   |
/// |                   |         |         |                   |
/// ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾-------------------‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
/// |         |         |         |         |         |         |
/// |         |         |         |         |         |         |
/// ----------------------------------------_____________________
/// |         |         |         |         |     Cổng phụ      |
/// |         |         |         |         |                   |
/// ----------------------------------------‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

/// BẢN ĐỒ VÍ DỤ VỀ MỘT TÒA NHÀ (2 x 6)
///
/// --------------------_____________________--------------------
/// |         |         |     Cổng vào      |         |         |
/// |         |         |                   |         |         |
/// --------------------‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾--------------------
/// |         |         |         |         |         |         |
/// |         |         |         |         |         |         |
/// --------------------_____________________--------------------
/// |         |         |                   |         |         |
/// |         |         |                   |         |         |
/// --------------------|   Toà nhà chính   |--------------------
/// |         |         |                   |         |         |
/// |         |         |                   |         |         |
/// --------------------‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾--------------------
/// |         |         |         |         |         |         |
/// |         |         |         |         |         |         |
/// --------------------_____________________--------------------
/// |         |         |      Cổng phụ     |         |         |
/// |         |         |                   |         |         |
/// --------------------‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾--------------------

const oneBuildingController = BuildingController(
  buildings: [
    BuildingData(
      name: 'Lối ra',
      detailMapImage: null,
      roomPins: [],
    ),
    BuildingArrowData(
      direction: BuildingArrowDirection.down,
    ),
    BuildingData(
      name: 'Toà nhà chính',
      detailMapImage: '',
      roomPins: [],
    ),
    BuildingArrowData(
      direction: BuildingArrowDirection.down,
    ),
    BuildingData(
      name: 'Cổng vào',
      detailMapImage: null,
      roomPins: [],
    ),
  ],
);

class BuildingController {
  const BuildingController({required this.buildings});

  final List<BuildingBase> buildings;

  List<Widget> get buildingWidgets {
    final widgets = <Widget>[];
    for (var index = 0; index < buildings.length; index++) {
      final building = buildings[index];
      widgets.add(building.toWidget(index));
    }
    return widgets;
  }
}

extension DataToWidget on BuildingBase {
  Widget toWidget(int index) {
    if (this is BuildingData) {
      return Building(
        this as BuildingData,
        delay: Durations.kMedium * index,
      );
    } else if (this is BuildingArrowData) {
      return BuildingArrow(
        this as BuildingArrowData,
        delay: Durations.kMedium * index,
      );
    } else {
      return const SizedBox();
    }
  }
}
