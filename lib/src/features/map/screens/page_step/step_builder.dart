import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tthc/src/features/map/controllers/blink_assistant_controller.dart';
import 'package:tthc/src/features/map/screens/page_step/action_step.dart';
import 'package:tthc/src/features/map/screens/page_step/goodbye_step.dart';
import 'package:tthc/src/features/map/screens/page_step/welcome_step.dart';
import 'package:tthc/src/utils/durations.dart';

class StepBuilder extends HookConsumerWidget {
  const StepBuilder({
    Key? key,
    required this.navigatorKey,
  }) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assistantController = ref.watch(blinkAssistantControllerProvider);

    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            blurRadius: 20,
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: PageTransitionSwitcher(
        duration: Durations.kFast.duration,
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.scaled,
            fillColor: Colors.transparent,
            child: child,
          );
        },
        child: _stepBuilder(assistantController),
      ),
    );
  }

  Widget _stepBuilder(BlinkAssistantController assistantController) {
    if (assistantController.isFinish) {
      return const GoodbyeStep();
    } else if (assistantController.currentStepInfo == null) {
      return const WelcomeStep();
    } else {
      return ActionStep(
        key: ValueKey(assistantController.currentStepInfo!.description),
        step: assistantController.currentStep,
        info: assistantController.currentStepInfo!,
      );
    }
  }
}
