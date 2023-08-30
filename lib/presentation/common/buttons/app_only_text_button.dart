import 'package:flutter/material.dart';

import 'app_button.dart';
import 'app_button_interface.dart';

class AppOnlyTextButton implements AppButtonInterface {
  const AppOnlyTextButton({
    required this.backgroundColor,
    required this.buttonName,
    required this.function,
  });

  final Color backgroundColor;
  final String buttonName;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
      child: Text(buttonName),
    );
  }
}
