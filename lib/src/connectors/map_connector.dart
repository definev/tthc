import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tthc/src/features/action/controllers/action_controller.dart';
import 'package:tthc/src/features/location/controllers/location_controller.dart';
import 'package:tthc/src/models/tthc_action.dart';
import 'package:tthc/src/models/tthc_location.dart';

final mapConnectorProvider = StateProvider((ref) {
  final location = ref.watch(locationControllerProvider);
  final action = ref.watch(actionControllerProvider);

  return MapConnector(
    action: action,
    location: location,
  );
});

class MapConnector {
  MapConnector({
    required this.location,
    required this.action,
  });

  final TTHCLocation? location;
  final TTHCAction? action;
}
