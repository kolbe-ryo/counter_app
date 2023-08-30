import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.style,
  });

  final AppButtonStyle style;

  static const _buttonHeight = 60.0;
  static const _buttonWidthRate = 0.66;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _buttonHeight,
      width: MediaQuery.of(context).size.width * _buttonWidthRate,
      child: style.build(context),
    );
  }
}

// TODO: ストラテジーパターンで、アイコンボタンとテキストボタンを実装する
abstract class AppButtonStyle {
  Widget build(BuildContext context);
}

class AppIconButton implements AppButtonStyle {
  const AppIconButton({
    required this.backgroundColor,
    required this.buttonName,
    required this.function,
  });

  final Color backgroundColor;
  final String buttonName;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.account_box),
      onPressed: function,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppButton._buttonHeight / 2),
          ),
        ),
        textStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      label: Text(buttonName),
    );
  }
}

class AppNormalButton implements AppButtonStyle {
  const AppNormalButton({
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
            Radius.circular(AppButton._buttonHeight / 2),
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
