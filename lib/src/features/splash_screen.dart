import 'package:flutter/material.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';
import 'package:tthc/src/features/form/screens/form_screen.dart';
import 'package:tthc/src/utils/durations.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PlayAnimation<double>(
            tween: Tween<double>(begin: 0, end: 1),
            duration: Durations.kSlowest.duration,
            curve: Curves.easeInOut,
            builder: (context, child, value) => Transform.translate(
              offset: Offset(0, -50 * (1 - value)),
              child: Opacity(
                opacity: value,
                child: child,
              ),
            ),
            child: Image.asset(
              'assets/splash.jpg',
              color: Theme.of(context).scaffoldBackgroundColor,
              colorBlendMode: BlendMode.modulate,
            ),
          ),
          PlayAnimation<double>(
            tween: Tween<double>(begin: 0, end: 1),
            duration: Durations.kSlowest.duration,
            curve: Curves.easeInOut,
            delay: Durations.kSlowest.duration * 0.5,
            builder: (context, child, value) => Transform.translate(
              offset: Offset(0, -50 * (1 - value)),
              child: Opacity(
                opacity: value,
                child: child,
              ),
            ),
            child: Text(
              'Thực hiện thủ tục hành chính\nnhanh chóng với T17',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 36),
          PlayAnimation<double>(
            tween: Tween<double>(begin: 0, end: 1),
            duration: Durations.kSlowest.duration,
            curve: Curves.easeInOut,
            delay: Durations.kSlowest.duration * 1.5,
            builder: (context, child, value) => Transform.translate(
              offset: Offset(0, -50 * (1 - value)),
              child: Opacity(
                opacity: value,
                child: child,
              ),
            ),
            child: ElevatedButton(
              child: const SizedBox(
                height: 56,
                width: 150,
                child: Center(child: Text('Bắt đầu')),
              ),
              onPressed: () => Navigator.of(context)
                  .pushReplacementNamed(FormScreen.routeName),
            ),
          ),
        ],
      ),
    );
  }
}
