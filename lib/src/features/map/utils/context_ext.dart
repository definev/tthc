import 'package:flutter/material.dart';

extension PositionExt on GlobalKey {
  Offset? get currentPosition {
    final box = currentContext?.findRenderObject() as RenderBox?;
    final position = box?.localToGlobal(Offset.zero);
    final size = box?.size;

    if (position != null && size != null) {
      return Offset(
        position.dx - 40 + size.width / 2,
        position.dy - 40 + size.height / 2,
      );
    } else {
      return null;
    }
  }
}
