import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/buttons/app_signup_buttons.dart';
import '../../common/buttons/back_app_button.dart';
import '../../common/image/animation_image.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

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
              'Create Account!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),
            AnimationImage.signUp(),
            const SizedBox(height: 60),
            const _SignUpButtons(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _SignUpButtons extends StatefulWidget {
  const _SignUpButtons();

  @override
  State<_SignUpButtons> createState() => __SignUpButtonsState();
}

class __SignUpButtonsState extends State<_SignUpButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSignUpButtons.email(),
        const SizedBox(height: 30),
        AppSignUpButtons.apple(),
        const SizedBox(height: 30),
        AppSignUpButtons.google(),
        const SizedBox(height: 60),
        BackAppButton.toTop(),
      ],
    );
  }
}
