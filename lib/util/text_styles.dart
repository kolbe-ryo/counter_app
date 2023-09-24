import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle largeFontStyle({Color color = Colors.black}) => TextStyle(
        color: color,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      );

  static const TextStyle middleFontStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}
