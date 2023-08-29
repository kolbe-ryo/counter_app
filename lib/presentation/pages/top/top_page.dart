import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../router.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Launch App!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            // ref.watch(lottieCache).load(Assets.animations.launchApp),
            const SizedBox(height: 60),
            _AuthenticationButton.signUp(),
            const SizedBox(height: 30),
            _AuthenticationButton.signIn(),
          ],
        ),
      ),
    );
  }
}

class _AuthenticationButton extends ConsumerWidget {
  const _AuthenticationButton._({
    required this.backgroundColor,
    required this.buttonName,
    required this.routing,
  });

  factory _AuthenticationButton.signUp() {
    return const _AuthenticationButton._(
      backgroundColor: Colors.cyan,
      buttonName: 'Create Account',
      routing: SignUpPageRoute.name,
    );
  }

  factory _AuthenticationButton.signIn() {
    return const _AuthenticationButton._(
      backgroundColor: Colors.deepOrangeAccent,
      buttonName: 'Sign In',
      routing: SignInPageRoute.name,
    );
  }

  final Color backgroundColor;
  final String buttonName;
  final String routing;

  static const _buttonHeight = 60.0;
  static const _buttonWidthRate = 0.66;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: _buttonHeight,
      width: MediaQuery.of(context).size.width * _buttonWidthRate,
      child: ElevatedButton(
        onPressed: () => ref.watch(routerProvider).go(routing),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(_buttonHeight / 2),
            ),
          ),
          textStyle: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(buttonName),
      ),
    );
  }
}
