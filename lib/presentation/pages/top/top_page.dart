import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/animation_image.dart';
import '../../common/buttons/app_button.dart';
import '../../common/buttons/routing_app_buttons.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              width: double.infinity,
            ),
            const Text(
              'Launch App!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            AnimationImage.launchApp(),
            const SizedBox(height: 90 + AppButton.buttonHeight),
            RoutingAppButtons.toSignUp(),
            const SizedBox(height: 30),
            RoutingAppButtons.toSignIn(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
