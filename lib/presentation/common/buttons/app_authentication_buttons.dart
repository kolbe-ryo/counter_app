import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'app_button.dart';
import 'app_icon_button.dart';

class AppAuthenticationButtons extends StatelessWidget {
  const AppAuthenticationButtons._({
    required this.backgroundColor,
    required this.buttonName,
    required this.function,
    required this.iconData,
  });

  factory AppAuthenticationButtons.email() {
    return AppAuthenticationButtons._(
      backgroundColor: Colors.lightBlue,
      buttonName: 'Email',
      function: () => {},
      iconData: FontAwesomeIcons.envelope,
    );
  }

  factory AppAuthenticationButtons.apple() {
    return AppAuthenticationButtons._(
      backgroundColor: Colors.cyan,
      buttonName: 'Apple',
      function: () => {},
      iconData: FontAwesomeIcons.apple,
    );
  }

  factory AppAuthenticationButtons.google() {
    return AppAuthenticationButtons._(
      backgroundColor: Colors.deepOrangeAccent,
      buttonName: 'Google',
      function: () => {},
      iconData: FontAwesomeIcons.google,
    );
  }

  final Color backgroundColor;
  final String buttonName;
  final void Function() function;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return AppButton.largeWidth(
      appButtonStyle: AppIconButton(
        backgroundColor: backgroundColor,
        buttonName: buttonName,
        function: function,
        iconData: iconData,
      ),
    );
  }
}
