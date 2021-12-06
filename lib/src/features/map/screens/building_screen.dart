import 'package:flutter/material.dart';

import 'package:tthc/src/features/map/models/building_data.dart';

class BuildingScreen extends StatelessWidget {
  const BuildingScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  static const routeName = '/map/building';

  final BuildingData data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: data.name,
          child: Text(data.name),
        ),
      ),
    );
  }
}
