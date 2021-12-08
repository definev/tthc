// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

import 'package:flutter/rendering.dart';

abstract class BuildingBase {
  const BuildingBase();
}

class BuildingData extends BuildingBase {
  const BuildingData({
    required this.relativePosition,
    required this.name,
    required this.rooms,
  });

  final Offset relativePosition;
  final String name;
  final List<RoomData>? rooms;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BuildingData && other.name == name;
  }

  @override
  int get hashCode => name.hashCode ^ rooms.hashCode;
}

class RoomData {
  const RoomData({
    required this.name,
    required this.height,
    required this.width,
  });

  final String name;
  final int height;
  final int width;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BuildingData && other.name == name;
  }

  @override
  int get hashCode => name.hashCode ^ height.hashCode ^ width.hashCode;
}

class BuildingSpacingData extends BuildingBase {}

enum BuildingArrowDirection { left, right, up, down }

class BuildingArrowData extends BuildingBase {
  const BuildingArrowData({
    required this.direction,
  });

  final BuildingArrowDirection direction;
}
