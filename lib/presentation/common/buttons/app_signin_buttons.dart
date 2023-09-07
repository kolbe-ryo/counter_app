import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'app_button.dart';
import 'app_icon_button.dart';

class AppSignInButtons extends StatelessWidget {
  const AppSignInButtons._({
    required this.backgroundColor,
    required this.buttonName,
    required this.onPressed,
    required this.iconData,
  });

  factory AppSignInButtons.email() {
    return AppSignInButtons._(
      backgroundColor: Colors.lightBlue,
      buttonName: 'Email',
      onPressed: () => {},
      iconData: FontAwesomeIcons.envelope,
    );
  }

  factory AppSignInButtons.apple() {
    return AppSignInButtons._(
      backgroundColor: Colors.cyan,
      buttonName: 'Apple',
      onPressed: () => {},
      iconData: FontAwesomeIcons.apple,
    );
  }

  factory AppSignInButtons.google() {
    return AppSignInButtons._(
      backgroundColor: Colors.deepOrangeAccent,
      buttonName: 'Google',
      onPressed: () => {},
      iconData: FontAwesomeIcons.google,
    );
  }

  final Color backgroundColor;
  final String buttonName;
  final void Function() onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return AppButton.largeWidth(
      appButtonStyle: AppIconButton(
        backgroundColor: backgroundColor,
        buttonName: buttonName,
        onPressed: onPressed,
        iconData: iconData,
      ),
    );
  }
}
