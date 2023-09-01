import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/animation_image.dart';
import '../../common/buttons/routing_app_buttons.dart';

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
            const SizedBox(height: 30),
            AnimationImage.launchApp(),
            const SizedBox(height: 60),
            RoutingAppButtons.toSignUp(),
            const SizedBox(height: 30),
            RoutingAppButtons.toSignIn(),
          ],
        ),
      ),
    );
  }
}
