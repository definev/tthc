import 'package:flutter/material.dart';

class GoodbyeStep extends StatelessWidget {
  const GoodbyeStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Chào tạm biệt!',
            style: Theme.of(context).textTheme.headline6,
          ),
          const Text('Hy vọng bạn hài lòng với trải nghiệm của chúng tôi.'),
        ],
      ),
    );
  }
}
