import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/animation_image.dart';
import '../../common/buttons/app_authentication_buttons.dart';
import '../../common/buttons/back_app_button.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select Authentication!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),
            AnimationImage.signUp(),
            const SizedBox(height: 60),
            AppAuthenticationButtons.email(),
            const SizedBox(height: 30),
            AppAuthenticationButtons.apple(),
            const SizedBox(height: 30),
            AppAuthenticationButtons.google(),
            const SizedBox(height: 60),
            const BackAppButton(),
          ],
        ),
      ),
    );
  }
}
