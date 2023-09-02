import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'app_button.dart';
import 'app_icon_button.dart';

class AppSignUpButtons extends StatelessWidget {
  const AppSignUpButtons._({
    required this.backgroundColor,
    required this.buttonName,
    required this.onPressed,
    required this.iconData,
  });

  factory AppSignUpButtons.email() {
    return AppSignUpButtons._(
      backgroundColor: Colors.lightBlue,
      buttonName: 'Email',
      onPressed: () => {},
      iconData: FontAwesomeIcons.envelope,
    );
  }

  factory AppSignUpButtons.apple() {
    return AppSignUpButtons._(
      backgroundColor: Colors.cyan,
      buttonName: 'Apple',
      onPressed: () => {},
      iconData: FontAwesomeIcons.apple,
    );
  }

  factory AppSignUpButtons.google() {
    return AppSignUpButtons._(
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
