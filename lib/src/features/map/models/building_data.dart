import 'package:flutter/widgets.dart';

abstract class BuildingBase {
  const BuildingBase();
}

class BuildingData extends BuildingBase {
  const BuildingData({
    required this.name,
    required this.detailMapImage,
    required this.roomPins,
  });

  final String name;
  final String? detailMapImage;
  final List<RoomPinData>? roomPins;
}

class RoomPinData {
  const RoomPinData({
    required this.name,
    required this.offset,
  });

  final String name;
  final Offset offset;
}

class BuildingSpacingData extends BuildingBase {}

enum BuildingArrowDirection { left, right, up, down }

class BuildingArrowData extends BuildingBase {
  const BuildingArrowData({
    required this.direction,
  });

  final BuildingArrowDirection direction;
}
