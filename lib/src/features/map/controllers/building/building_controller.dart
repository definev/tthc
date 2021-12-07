import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:tthc/src/features/map/models/building_data.dart';
import 'package:tthc/src/features/map/utils/context_ext.dart';
import 'package:tthc/src/features/map/widgets/room.dart';

final buildingControllerProvider =
    ChangeNotifierProvider.autoDispose.family<BuildingController, BuildingData>(
  (ref, building) => BuildingController(building: building),
);

class BuildingController extends ChangeNotifier {
  BuildingController({
    required this.building,
  });

  final BuildingData building;

  late final List<GlobalKey> markerKeys = List.generate(
    building.rooms!.length,
    (index) => GlobalKey(),
  );
  late final List<JustTheController> toolTipControllerList = List.generate(
    building.rooms!.length,
    (index) => JustTheController(),
  );

  Widget markerWidget(BuildContext context, double tileSize) {
    return SafeArea(
      child: Center(
        child: SizedBox(
          height: tileSize * 3,
          width: tileSize * 3,
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 3,
            // reverse: true,
            itemCount: building.rooms!.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) => SizedBox(
              key: ValueKey(building.rooms![index].name),
              child: Container(
                key: markerKeys[index],
                color: Theme.of(context).colorScheme.surface,
                child: Center(
                  child: Room(
                    tooltipController: toolTipControllerList[index],
                    data: building.rooms![index],
                  ),
                ),
              ),
            ),
            staggeredTileBuilder: (int index) {
              return StaggeredTile.count(
                building.rooms![index].width,
                building.rooms![index].height.toDouble(),
              );
            },
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
        ),
      ),
    );
  }

  Future<Offset?> getPosition(int index) async {
    final key = markerKeys[index];
    return key.currentPosition;
  }

  void showTooltipAt(int index) {
    toolTipControllerList[index].showTooltip();
  }
}
