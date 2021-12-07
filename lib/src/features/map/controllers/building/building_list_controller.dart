import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tthc/src/features/map/models/building_data.dart';
import 'package:tthc/src/features/map/utils/context_ext.dart';
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
final oneBuildingController = BuildingListController(
  buildings: [
    const BuildingData(
      name: 'Lối ra',
      rooms: null,
    ),
    const BuildingArrowData(
      direction: BuildingArrowDirection.down,
    ),
    const BuildingData(
      name: 'Tòa nhà chính',
      rooms: [
        // Tầng 3
        RoomData(name: 'Văn phòng - Thống kê', height: 1, width: 1),
        RoomData(name: 'Văn hóa - Xã hội', height: 1, width: 1),
        RoomData(name: 'Quản lý đô thị - xây dựng', height: 1, width: 1),
        // Tầng 2
        RoomData(name: 'Tư pháp - Hộ tịch', height: 1, width: 1),
        RoomData(name: 'Địa chính - Xây dựng', height: 1, width: 1),
        RoomData(name: 'Tài chính - Kế toán', height: 1, width: 1),
        // Tầng 1
        RoomData(name: 'Tiếp dân', height: 1, width: 2),
        RoomData(name: 'Tài nguyên - môi trường', height: 1, width: 1),
      ],
    ),
    const BuildingArrowData(
      direction: BuildingArrowDirection.down,
    ),
    const BuildingData(
      name: 'Cổng vào',
      rooms: null,
    ),
  ],
);

final buildingListControllerProvider =
    ChangeNotifierProvider<BuildingListController>(
  (_) => oneBuildingController,
);

class BuildingListController extends ChangeNotifier {
  BuildingListController({required this.buildings});

  final List<BuildingBase> buildings;

  late List<GlobalKey> childKeys = buildings.map((e) => GlobalKey()).toList();

  List<Widget> get buildingWidgets {
    final widgets = <Widget>[];
    for (var index = 0; index < buildings.length; index++) {
      final building = buildings[index];
      widgets.add(building.toWidget(index, childKeys[index]));
    }
    return widgets;
  }

  Future<Offset?> getPosition(int index) async {
    final key = childKeys[index];
    return key.currentPosition;
  }
}

extension DataToWidget on BuildingBase {
  Widget toWidget(
    int index,
    GlobalKey key,
  ) {
    if (this is BuildingData) {
      return Building(
        this as BuildingData,
        key: key,
        index: index,
        delay: Durations.kMedium * index,
      );
    } else if (this is BuildingArrowData) {
      return BuildingArrow(
        this as BuildingArrowData,
        key: key,
        delay: Durations.kMedium * index,
      );
    } else {
      return const SizedBox();
    }
  }
}
