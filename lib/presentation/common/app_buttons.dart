import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../router.dart';

class AppButtons extends ConsumerWidget {
  const AppButtons._({
    required this.backgroundColor,
    required this.buttonName,
    required this.routing,
  });

  factory AppButtons.toSignUp() {
    return const AppButtons._(
      backgroundColor: Colors.cyan,
      buttonName: 'Create Account',
      routing: SignUpPageRoute.name,
    );
  }

  factory AppButtons.toSignIn() {
    return const AppButtons._(
      backgroundColor: Colors.deepOrangeAccent,
      buttonName: 'Sign In',
      routing: SignInPageRoute.name,
    );
  }

  factory AppButtons.toTop() {
    return const AppButtons._(
      backgroundColor: Colors.blueGrey,
      buttonName: 'Back to Top',
      routing: TopPageRoute.name,
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
