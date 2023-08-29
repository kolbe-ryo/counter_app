import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/app_buttons.dart';

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
            AppButtons.toSignUp(),
            const SizedBox(height: 30),
            AppButtons.toSignIn(),
          ],
        ),
      ),
    );
  }
}
