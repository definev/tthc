import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tthc/src/features/map/controllers/blink_assistant_controller.dart';
import 'package:tthc/src/features/map/models/action_data.dart';
import 'package:tthc/src/utils/durations.dart';

class ActionStep extends ConsumerWidget {
  const ActionStep({
    Key? key,
    required this.step,
    required this.info,
    this.onBack,
  }) : super(key: key);

  final int step;
  final StepInfo info;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assistantController = ref.watch(blinkAssistantControllerProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      floatingActionButton: (assistantController.isLastStep)
          ? FloatingActionButton.extended(
              onPressed: assistantController.addLastPosition,
              icon: const Icon(Icons.check),
              label: const Text('Hoàn thành'),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 11),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  info.title,
                  key: ValueKey('title_$step'),
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                AnimatedSwitcher(
                  duration: Durations.kFast.duration,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      assistantController.back();
                      onBack?.call();
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Quay lại'),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                info.description,
                  key: ValueKey('description_$step'),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
