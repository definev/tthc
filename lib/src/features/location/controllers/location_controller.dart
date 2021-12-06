import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tthc/src/models/tthc_location.dart';

final locationControllerProvider = StateProvider<TTHCLocation?>((_) => null);
