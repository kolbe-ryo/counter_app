import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_button.dart';

class ActionAppButtons extends ConsumerWidget {
  const ActionAppButtons._({
    required this.backgroundColor,
    required this.buttonName,
    required this.function,
  });

  factory ActionAppButtons.email() {
    return ActionAppButtons._(
      backgroundColor: Colors.deepOrangeAccent,
      buttonName: 'EMAIL / PASSWORD',
      function: () => {},
    );
  }

  // factory ActionAppButtons.toSignIn() {
  //   return const ActionAppButtons._(
  //     backgroundColor: Colors.deepOrangeAccent,
  //     buttonName: 'Sign In',
  //     routing: SignInPageRoute.name,
  //   );
  // }

  // factory ActionAppButtons.toTop() {
  //   return const ActionAppButtons._(
  //     backgroundColor: Colors.blueGrey,
  //     buttonName: 'Back to Top',
  //     routing: TopPageRoute.name,
  //   );
  // }

  final Color backgroundColor;
  final String buttonName;
  final void Function() function;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      style: AppIconButton(
        backgroundColor: backgroundColor,
        buttonName: buttonName,
        function: function,
      ),
    );
  }
}
