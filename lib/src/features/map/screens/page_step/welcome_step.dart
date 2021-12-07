import 'package:flutter/material.dart';

class WelcomeStep extends StatelessWidget {
  const WelcomeStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Chào tôi là Team17',
            style: Theme.of(context).textTheme.headline6,
          ),
          const Text('Tôi sẽ hướng dẫn bạn làm thủ tục nhanh chóng'),
        ],
      ),
    );
  }
}
