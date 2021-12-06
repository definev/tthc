import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:tthc/src/utils/styles.dart';

enum _AniProps { scale }

class BlinkAssistant extends HookWidget {
  const BlinkAssistant({
    Key? key,
    this.scale = 1,
  }) : super(key: key);

  final double scale;

  @override
  Widget build(BuildContext context) {
    final tween = useMemoized(
      () => TimelineTween<_AniProps>()
        ..addScene(
          begin: Duration.zero,
          end: Durations.kSlow.duration,
          curve: Curves.easeInOutCirc,
        ).animate(_AniProps.scale, tween: Tween<double>(begin: 0, end: 1)),
    );

    return MirrorAnimation<TimelineValue<_AniProps>>(
      tween: tween,
      builder: (context, child, value) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Transform.scale(
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
                        .primaryVariant
                        .withOpacity(0.3),
                  ),
                ),
                Container(
                  height: 50 + 15 * value.get(_AniProps.scale),
                  width: 50 + 15 * value.get(_AniProps.scale),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .colorScheme
                        .primaryVariant
                        .withOpacity(0.6),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .colorScheme
                        .primaryVariant
                        .withOpacity(0.8),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.touch_app,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
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
