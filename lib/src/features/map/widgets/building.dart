import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:tthc/src/features/map/models/building_data.dart';
import 'package:tthc/src/utils/styles.dart';

enum _BuildingAnimationType { scale, fade, borderWidth, borderRadius, shadow }

class Building extends HookConsumerWidget {
  const Building(
    this.data, {
    Key? key,
    required this.index,
    this.delay = 0,
  }) : super(key: key);

  final int delay;
  final int index;
  final BuildingData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tween = useMemoized(
      () => TimelineTween<_BuildingAnimationType>()
        ..addScene(
          begin: Duration.zero,
          end: Durations.kFast.duration,
          curve: Curves.bounceIn,
        )
            .animate(
              _BuildingAnimationType.scale,
              tween: Tween<double>(begin: 0, end: 1),
            )
            .animate(
              _BuildingAnimationType.fade,
              tween: Tween<double>(begin: 0, end: 1),
            )
        ..addScene(
          begin: Duration.zero,
          end: Durations.kFast.duration,
          curve: Curves.decelerate,
        )
            .animate(
              _BuildingAnimationType.borderRadius,
              tween: Tween<double>(begin: 0, end: 8),
            )
            .animate(
              _BuildingAnimationType.borderWidth,
              tween: Tween<double>(begin: 0, end: 3),
            )
            .animate(
              _BuildingAnimationType.shadow,
              tween: ColorTween(
                begin: Colors.transparent,
                end: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
              ),
            ),
    );

    return PlayAnimation<TimelineValue<_BuildingAnimationType>>(
      tween: tween,
      delay: Duration(milliseconds: delay),
      builder: (context, child, value) {
        return Transform.scale(
          scale: value.get(_BuildingAnimationType.scale),
          child: Opacity(
            opacity: value.get(_BuildingAnimationType.fade),
            child: Container(
              height: 90,
              width: 150,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(
                  value.get(_BuildingAnimationType.borderRadius),
                ),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: value.get(_BuildingAnimationType.borderWidth),
                ),
                boxShadow: [
                  BoxShadow(
                    color: value.get(_BuildingAnimationType.shadow),
                    blurRadius: 10,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  data.name,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
          ),
        );
      },
    );

    // return OpenContainer(
    //   key: ValueKey(data.name),
    //   openBuilder: (context, action) => BuildingScreen(data: data),
    //   openColor: Theme.of(context).backgroundColor,
    //   middleColor: Theme.of(context).backgroundColor,
    //   closedColor: Theme.of(context).scaffoldBackgroundColor,
    //   closedElevation: 0,
    //   closedShape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(8),
    //   ),
    //   openShape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(8),
    //   ),
    //   transitionType: ContainerTransitionType.fade,
    //   transitionDuration: Durations.kMedium.duration,
    //   closedBuilder: (context, action) =>
    //       PlayAnimation<TimelineValue<_BuildingAnimationType>>(
    //     tween: tween,
    //     delay: Duration(milliseconds: delay),
    //     builder: (context, child, value) {
    //       return GestureDetector(
    //         onTap: () {
    //           if (data.roomPins != null) {
    //             action();
    //           }
    //           // Navigator.pushNamed(
    //           //   context,
    //           //   BuildingScreen.routeName,
    //           //   arguments: data,
    //           // );
    //         },
    //         child: Transform.scale(
    //           scale: value.get(_BuildingAnimationType.scale),
    //           child: Opacity(
    //             opacity: value.get(_BuildingAnimationType.fade),
    //             child: Container(
    //               height: 90,
    //               width: MediaQuery.of(context).size.width * 0.5,
    //               decoration: BoxDecoration(
    //                 color: Theme.of(context).colorScheme.background,
    //                 borderRadius: BorderRadius.circular(
    //                   value.get(_BuildingAnimationType.borderRadius),
    //                 ),
    //                 border: Border.all(
    //                   color: Theme.of(context).colorScheme.primary,
    //                   width: value.get(_BuildingAnimationType.borderWidth),
    //                 ),
    //               ),
    //               child: Center(
    //                 child: Text(
    //                   data.name,
    //                   style: Theme.of(context).textTheme.subtitle1,
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
