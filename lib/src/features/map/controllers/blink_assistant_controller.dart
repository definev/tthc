// ignore_for_file: unawaited_futures

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tthc/src/features/map/controllers/building/building_controller.dart';
import 'package:tthc/src/features/map/controllers/building/building_list_controller.dart';
import 'package:tthc/src/features/map/models/action_data.dart';
import 'package:tthc/src/features/map/models/building_data.dart';
import 'package:tthc/src/features/map/screens/building_screen.dart';
import 'package:tthc/src/features/map/utils/context_ext.dart';
import 'package:tthc/src/features/map/utils/navigation_key.dart';
import 'package:tthc/src/utils/durations.dart';

final actionDataProvider =
    StateProvider<ActionData>((ref) => identifyActionDataUsecase);

final blinkAssistantControllerProvider = ChangeNotifierProvider.autoDispose(
  (ref) {
    final actionData = ref.watch(actionDataProvider);
    return BlinkAssistantController(ref.read, actionData);
  },
);

class BlinkAssistantController extends ChangeNotifier {
  BlinkAssistantController(this._read, this._actionData);

  final ActionData _actionData;

  StepInfo? get currentStepInfo =>
      actualStep < 0 && !isFinish ? null : _actionData.stepInfos[actualStep];
  int get actualStep => currentStep - 1;
  bool get isLastStep => actualStep == _actionData.stepInfos.length - 1;
  bool get isFinish => actualStep >= _actionData.stepInfos.length;
  int currentStep = 0;

  final Reader _read;

  List<Offset> positions = [];

  bool get isInit => positions.isNotEmpty;

  Future<Offset?> calculateStep(int step) async {
    final action = _actionData.stepTravelled[step - 1];

    // ADD POSITION WITH BUILDING ACTION
    if (action is BuildingAction) {
      final listController = _read(buildingListControllerProvider);
      final buildingIndex = listController.buildings.indexWhere(
        (e) => e is BuildingData && e.name == action.buildingName,
      );
      final latestContext = _read(latestContextProvider);
      final latestContextController = _read(latestContextProvider.notifier);

      if (latestContext != null) {
        Navigator.pop(latestContext);
        latestContextController.state = null;
        return Future.delayed(
          Durations.kFast.duration,
          () {
            if (step < positions.length) {
              return positions[step];
            }
            return listController.childKeys[buildingIndex].currentPosition;
          },
        );
      } else {
        if (step < positions.length) {
          return positions[step];
        }
        return listController.childKeys[buildingIndex].currentPosition;
      }
    }

    if (action is RoomAction) {
      final listController = _read(buildingListControllerProvider);
      final buildingIndex = listController.buildings.indexWhere(
        (e) => e is BuildingData && e.name == action.buildingName,
      );
      final buildingData =
          listController.buildings[buildingIndex] as BuildingData;

      final roomIndex = buildingData.rooms!.indexWhere(
        (e) => e.name == action.roomName,
      );

      final latestContext = _read(latestContextProvider);

      if (latestContext == null) {
        final context = _read(navigatorKeyProvider).currentContext!;
        Navigator.of(context).pushNamed(
          BuildingScreen.routeName,
          arguments: buildingData,
        );
      } else {
        final name = ModalRoute.of(latestContext)!.settings.name;
        final navigator = Navigator.of(latestContext);

        if (name?.substring(0, 2) == 'b:') {
          if (name != 'b:${buildingData.name}') {
            navigator
              ..pop()
              ..pushNamed(
                BuildingScreen.routeName,
                arguments: buildingData,
              );
          }
        } else {
          navigator.pushNamed(
            BuildingScreen.routeName,
            arguments: buildingData,
          );
        }
      }

      if (step < positions.length) {
        Future.delayed(
          Durations.kFast.duration,
          () {
            _read(buildingControllerProvider(buildingData))
                .showTooltipAt(roomIndex);
          },
        );
        return positions[step];
      }

      var duration = Durations.kFast.duration;
      final actionIndex = _actionData.stepTravelled.indexWhere(
        (e) => e == action,
      );
      if (_actionData.stepTravelled[actionIndex - 1] is BuildingAction) {
        duration = (Durations.kFast + 80).duration;
      }

      return Future.delayed(
        duration,
        () async {
          final buildingController =
              _read(buildingControllerProvider(buildingData));
          final position =
              buildingController.markerKeys[roomIndex].currentPosition;
          buildingController.showTooltipAt(roomIndex);

          if (position == null) {
            final position =
                buildingController.markerKeys[roomIndex].currentPosition;
            return position;
          }

          return position;
        },
      );
    }
  }

  Future<void> addPosition() async {
    if (currentStep >= _actionData.stepTravelled.length) {
      return;
    }
    if (currentStep == positions.length - 1) {
      final position = await calculateStep(currentStep + 1);
      if (position != null) {
        positions.add(position);
        currentStep++;
        notifyListeners();
      }
    } else {
      await calculateStep(currentStep + 1);
      currentStep++;
      notifyListeners();
    }
  }

  Future<void> addInitPosition(Offset position) async {
    positions.add(position);
    currentStep = positions.length - 1;
    notifyListeners();
  }

  Future<void> addLastPosition() async {
    positions.add(positions[0]);
    currentStep = positions.length - 1;
    notifyListeners();
  }

  Future<bool> back() async {
    if (currentStep > 1) {
      final position = await calculateStep(currentStep - 1);
      if (position != null) {
        currentStep--;
        notifyListeners();
      }
      return false;
    } else if (currentStep == 1) {
      currentStep = 0;
      notifyListeners();
      return false;
    } else {
      return true;
    }
  }

  Future<void> next() async {
    if (currentStep < positions.length - 1) {
      final position = await calculateStep(currentStep + 1);
      if (position != null) {
        currentStep--;
        notifyListeners();
      }
    }
  }

  Offset get currentAssistantPos {
    return positions[currentStep];
  }
}
