import 'package:flutter/material.dart';

import '../../constant_value.dart';
import 'app_button.dart';
import 'app_button_interface.dart';

class AppIconButton implements AppButtonInterface {
  const AppIconButton({
    required this.backgroundColor,
    required this.buttonName,
    required this.function,
    required this.iconData,
  });

  final Color backgroundColor;
  final String buttonName;
  final void Function() function;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(
        iconData,
        size: 30,
      ),
      onPressed: function,
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
