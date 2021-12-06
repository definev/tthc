import 'package:flutter/material.dart';

class TTHCAction {
  const TTHCAction({
    required this.id,
    required this.name,
    required this.icons,
    required this.description,
  });

  final String id;
  final String name;
  final IconData icons;
  final String description;
}
