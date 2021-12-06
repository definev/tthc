import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:tthc/src/features/map/models/building_data.dart';
import 'package:tthc/src/utils/styles.dart';

enum _BuildingArrowAnimationType {
  height,
  width,
  fade,
}

class BuildingArrow extends HookWidget {
  const BuildingArrow(this.data, {Key? key, this.delay = 0}) : super(key: key);

  final int delay;
  final BuildingArrowData data;

  Alignment get alignment {
    switch (data.direction) {
      case BuildingArrowDirection.up:
        return Alignment.topCenter;
      case BuildingArrowDirection.down:
        return Alignment.bottomCenter;
      case BuildingArrowDirection.left:
        return Alignment.centerLeft;
      case BuildingArrowDirection.right:
        return Alignment.centerRight;
    }
  }

  bool get isVertical =>
      data.direction == BuildingArrowDirection.up ||
      data.direction == BuildingArrowDirection.down;

  static const double fixedSize = 60;
  static const double extendedSize = 70;

  @override
  Widget build(BuildContext context) {
    final tween = useMemoized(
      () => TimelineTween<_BuildingArrowAnimationType>()
        ..addScene(
          begin: Duration.zero,
          end: Durations.kFast.duration,
        )
            .animate(
              _BuildingArrowAnimationType.height,
              tween: Tween<double>(
                begin: data.direction == BuildingArrowDirection.down ||
                        data.direction == BuildingArrowDirection.up
                    ? 0
                    : 1,
                end: 1,
              ),
            )
            .animate(
              _BuildingArrowAnimationType.width,
              tween: Tween<double>(
                begin: data.direction == BuildingArrowDirection.left ||
                        data.direction == BuildingArrowDirection.right
                    ? 0
                    : 1,
                end: 1,
              ),
            )
            .animate(
              _BuildingArrowAnimationType.fade,
              tween: Tween<double>(begin: 0, end: 1),
            ),
    );

    return PlayAnimation<TimelineValue<_BuildingArrowAnimationType>>(
      tween: tween,
      delay: Duration(milliseconds: delay),
      builder: (context, child, value) {
        return Opacity(
          opacity: value.get(_BuildingArrowAnimationType.fade),
          child: Stack(
            children: [
              Align(
                alignment: alignment,
                child: Container(
                  height: (isVertical ? fixedSize : 3) *
                      value.get(_BuildingArrowAnimationType.height),
                  width: (isVertical ? 3 : fixedSize) *
                      value.get(_BuildingArrowAnimationType.width),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryVariant,
                  ),
                  margin: isVertical
                      ? const EdgeInsets.symmetric(vertical: 10)
                      : const EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
              if (isVertical)
                _buildVerticalDot(context, value)
              else
                _buildHorizontalDot(context, value)
            ],
          ),
        );
      },
    );
  }

  Widget _buildVerticalDot(
    BuildContext context,
    TimelineValue<_BuildingArrowAnimationType> value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        height: extendedSize * value.get(_BuildingArrowAnimationType.height),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height:
                    10 * value.get<double>(_BuildingArrowAnimationType.height),
                width:
                    10 * value.get<double>(_BuildingArrowAnimationType.height),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryVariant,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                height:
                    10 * value.get<double>(_BuildingArrowAnimationType.height),
                width:
                    10 * value.get<double>(_BuildingArrowAnimationType.height),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryVariant,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalDot(
    BuildContext context,
    TimelineValue<_BuildingArrowAnimationType> value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        width: extendedSize * value.get(_BuildingArrowAnimationType.width),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height:
                    10 * value.get<double>(_BuildingArrowAnimationType.width),
                width:
                    10 * value.get<double>(_BuildingArrowAnimationType.width),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryVariant,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                height:
                    10 * value.get<double>(_BuildingArrowAnimationType.width),
                width:
                    10 * value.get<double>(_BuildingArrowAnimationType.width),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryVariant,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
