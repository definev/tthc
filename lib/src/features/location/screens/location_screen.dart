import 'package:dvhcvn/dvhcvn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LocationScreen extends HookWidget {
  const LocationScreen({Key? key}) : super(key: key);

  static const routeName = '/location';

  @override
  Widget build(BuildContext context) {
    final level1 = useState<Level1?>(null);
    final level2 = useState<Level2?>(null);

    if (level1.value == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Chọn địa chỉ')),
        body: ListView.builder(
          itemCount: level1s.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(level1s[index].name),
            onTap: () {
              level1.value = level1s[index];
              level2.value = null;
            },
          ),
        ),
      );
    }

    if (level2.value == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Chọn địa chỉ')),
        body: ListView.builder(
          itemCount: level1.value!.children.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(level1.value!.children[index].name),
            onTap: () {
              level2.value = level1.value!.children[index];
            },
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Chọn địa chỉ')),
      body: ListView.builder(
        itemCount: level2.value!.children.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(level2.value!.children[index].name),
          onTap: () =>
              Navigator.pop(context, level2.value!.children[index].toString()),
        ),
      ),
    );
  }
}
