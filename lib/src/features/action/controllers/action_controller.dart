import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tthc/src/models/tthc_action.dart';

final actionControllerProvider = StateProvider<TTHCAction?>((_) => null);
