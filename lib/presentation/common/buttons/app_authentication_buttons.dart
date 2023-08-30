import 'package:flutter/material.dart';

import 'app_button.dart';
import 'app_icon_button.dart';

class AppAuthenticationButtons extends StatelessWidget {
  const AppAuthenticationButtons._({
    required this.backgroundColor,
    required this.buttonName,
    required this.function,
  });

  factory AppAuthenticationButtons.email() {
    return AppAuthenticationButtons._(
      backgroundColor: Colors.deepOrangeAccent,
      buttonName: 'Email/Password',
      function: () => {},
    );
  }

  factory AppAuthenticationButtons.apple() {
    return AppAuthenticationButtons._(
      backgroundColor: Colors.deepOrangeAccent,
      buttonName: 'Email/Password',
      function: () => {},
    );
  }

  factory AppAuthenticationButtons.google() {
    return AppAuthenticationButtons._(
      backgroundColor: Colors.deepOrangeAccent,
      buttonName: 'google',
      function: () => {},
    );
  }

  final Color backgroundColor;
  final String buttonName;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return AppButton.largeWidth(
      appButtonStyle: AppIconButton(
        backgroundColor: backgroundColor,
        buttonName: buttonName,
        function: function,
      ),
    );
  }
}
