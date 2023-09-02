import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constant_value.dart';
import 'app_button.dart';
import 'app_button_interface.dart';

class AppIconButton implements AppButtonInterface {
  const AppIconButton({
    required this.backgroundColor,
    required this.buttonName,
    required this.onPressed,
    required this.iconData,
  });

  final Color backgroundColor;
  final String buttonName;
  final void Function() onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: FaIcon(
        iconData,
        size: 25,
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppButton.buttonHeight / 2),
          ),
        ),
        textStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      label: Padding(
        padding: const EdgeInsets.only(left: kPadding),
        child: Text(buttonName),
      ),
    );
  }
}
