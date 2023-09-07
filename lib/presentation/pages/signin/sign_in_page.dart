import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/buttons/app_signin_buttons.dart';
import '../../common/buttons/back_app_button.dart';
import '../../common/buttons/routing_app_buttons.dart';
import '../../common/image/animation_image.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

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
              'Sign In!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),
            AnimationImage.signIn(),
            const SizedBox(height: 60),
            const _SignInButtons(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _SignInButtons extends StatefulWidget {
  const _SignInButtons();

  @override
  State<_SignInButtons> createState() => __SignInButtonsState();
}

// TODO: ボタンのタップ時の出し隠しをアニメーションにする
class __SignInButtonsState extends State<_SignInButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSignInButtons.email(),
        const SizedBox(height: 30),
        AppSignInButtons.apple(),
        const SizedBox(height: 30),
        AppSignInButtons.google(),
        const SizedBox(height: 30),
        RoutingAppButtons.toMain(),
        const SizedBox(height: 60),
        const BackAppButton(),
      ],
    );
  }
}
