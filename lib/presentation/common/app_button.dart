import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.backgroundColor,
    required this.buttonName,
    required this.function,
  });

  final Color backgroundColor;
  final String buttonName;
  final void Function() function;

  static const _buttonHeight = 60.0;
  static const _buttonWidthRate = 0.66;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _buttonHeight,
      width: MediaQuery.of(context).size.width * _buttonWidthRate,
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(_buttonHeight / 2),
            ),
          ),
          textStyle: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(buttonName),
      ),
    );
  }
}
