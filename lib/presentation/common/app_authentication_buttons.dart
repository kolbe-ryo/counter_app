import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'button/app_button.dart';
import 'button/app_icon_button.dart';

class AppAuthenticationButtons extends ConsumerWidget {
  const AppAuthenticationButtons._({
    required this.backgroundColor,
    required this.buttonName,
    required this.function,
  });

  factory AppAuthenticationButtons.email() {
    return AppAuthenticationButtons._(
      backgroundColor: Colors.deepOrangeAccent,
      buttonName: 'EMAIL / PASSWORD',
      function: () => {},
    );
  }

  // factory AppAuthenticationButtons.toSignIn() {
  //   return const AppAuthenticationButtons._(
  //     backgroundColor: Colors.deepOrangeAccent,
  //     buttonName: 'Sign In',
  //     routing: SignInPageRoute.name,
  //   );
  // }

  // factory AppAuthenticationButtons.toTop() {
  //   return const AppAuthenticationButtons._(
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
    return AppButton.largeWidth(
      appButtonStyle: AppIconButton(
        backgroundColor: backgroundColor,
        buttonName: buttonName,
        function: function,
      ),
    );
  }
}
