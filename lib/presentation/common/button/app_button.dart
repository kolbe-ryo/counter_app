import 'package:flutter/material.dart';

import 'app_button_interface.dart';

class AppButton extends StatelessWidget {
  const AppButton._({
    required this.appButtonStyle,
    required this.buttonWidthRate,
  });

  factory AppButton.largeWidth({
    required AppButtonInterface appButtonStyle,
  }) {
    return AppButton._(
      appButtonStyle: appButtonStyle,
      buttonWidthRate: 0.66,
    );
  }

  final AppButtonInterface appButtonStyle;
  final double buttonWidthRate;

  static const buttonHeight = 60.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      width: MediaQuery.of(context).size.width * buttonWidthRate,
      child: appButtonStyle.build(context),
    );
  }
}
