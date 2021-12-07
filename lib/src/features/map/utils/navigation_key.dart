import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigatorKeyProvider =
    Provider.autoDispose<GlobalKey<NavigatorState>>((ref) => GlobalKey());

final latestContextProvider = StateProvider<BuildContext?>((ref) => null);
