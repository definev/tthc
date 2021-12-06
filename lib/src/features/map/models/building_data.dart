import 'package:flutter/widgets.dart';

class BuildingBase {
  const BuildingBase(this.height, this.width);

  final int height;
  final int width;
}

class BuildingData extends BuildingBase {
  const BuildingData({
    required int height,
    required int width,
    required this.name,
    required this.detailMapImage,
    required this.roomPins,
  }) : super(height, width);

  final String name;
  final String detailMapImage;
  final List<Offset> roomPins;
}

class BuildingSpacingData extends BuildingBase {
  const BuildingSpacingData({required int height, required int width})
      : super(height, width);
}

enum ArrowDirection { left, right, up, down }

class BuildingArrowData extends BuildingBase {
  const BuildingArrowData({
    required this.direction,
    required int height,
    required int width,
  }) : super(height, width);

  final ArrowDirection direction;
}
