import 'package:flutter/material.dart';

class WelcomeStep extends StatelessWidget {
  const WelcomeStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            blurRadius: 20,
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Chào tôi là Team17',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 80),
          const Text('Tôi sẽ hướng dẫn bạn làm thủ tục nhanh chóng'),
        ],
      ),
    );
  }
}
