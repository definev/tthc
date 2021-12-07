import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:tthc/src/features/map/controllers/blink_assistant_controller.dart';
import 'package:tthc/src/utils/styles.dart';

enum _AniProps { scale }

class BlinkAssistant extends HookConsumerWidget {
  const BlinkAssistant({
    Key? key,
    this.scale = 1,
  }) : super(key: key);

  final double scale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tween = useMemoized(
      () => TimelineTween<_AniProps>()
        ..addScene(
          begin: Duration.zero,
          end: Durations.kSlow.duration,
          curve: Curves.easeInOutCirc,
        ).animate(_AniProps.scale, tween: Tween<double>(begin: 0, end: 1)),
    );
    final controller = ref.watch(blinkAssistantControllerProvider);

    return GestureDetector(
      onTap: () {
        if (controller.isFinish == true) {
          Navigator.pop(context);
        } else {
          controller.addPosition();
        }
      },
      child: MirrorAnimation<TimelineValue<_AniProps>>(
        tween: tween,
        builder: (context, child, value) => Transform.scale(
          scale: scale,
          child: SizedBox(
            height: 80,
            width: 80,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 50 + 30 * value.get(_AniProps.scale),
                  width: 50 + 30 * value.get(_AniProps.scale),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.1),
                  ),
                ),
                Container(
                  height: 50 + 15 * value.get(_AniProps.scale),
                  width: 50 + 15 * value.get(_AniProps.scale),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.1),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.6),
                  ),
                  alignment: Alignment.center,
                  child: AnimatedSwitcher(
                    duration: Durations.kSlow.duration,
                    child: controller.currentStep == 0
                        ? Icon(
                            Icons.touch_app,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(0.8),
                          )
                        : const SizedBox(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
