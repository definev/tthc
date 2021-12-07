import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:tthc/src/features/map/models/building_data.dart';

class Room extends StatelessWidget {
  const Room({
    Key? key,
    required this.tooltipController,
    required this.data,
  }) : super(key: key);

  final JustTheController tooltipController;
  final RoomData data;

  @override
  Widget build(BuildContext context) {
    return JustTheTooltip(
      controller: tooltipController,
      tailLength: 5,
      preferredDirection: AxisDirection.up,
      margin: const EdgeInsets.all(12),
      content: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(data.name),
      ),
      child: GestureDetector(
        onTap: () => tooltipController.showTooltip(),
        child: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Icon(
            Icons.more_horiz,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
