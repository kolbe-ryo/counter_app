import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../router.dart';
import 'app_button.dart';

class RoutingAppButtons extends ConsumerWidget {
  const RoutingAppButtons._({
    required this.backgroundColor,
    required this.buttonName,
    required this.routing,
  });

  factory RoutingAppButtons.toSignUp() {
    return const RoutingAppButtons._(
      backgroundColor: Colors.cyan,
      buttonName: 'Create Account',
      routing: SignUpPageRoute.name,
    );
  }

  factory RoutingAppButtons.toSignIn() {
    return const RoutingAppButtons._(
      backgroundColor: Colors.deepOrangeAccent,
      buttonName: 'Sign In',
      routing: SignInPageRoute.name,
    );
  }

  factory RoutingAppButtons.toTop() {
    return const RoutingAppButtons._(
      backgroundColor: Colors.blueGrey,
      buttonName: 'Back to Top',
      routing: TopPageRoute.name,
    );
  }

  final Color backgroundColor;
  final String buttonName;
  final String routing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      style: AppNormalButton(
        backgroundColor: backgroundColor,
        buttonName: buttonName,
        function: () => ref.watch(routerProvider).go(routing),
      ),
    );
  }
}
