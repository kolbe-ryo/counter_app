import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// テーマプロバイダー
final themeProvider = Provider.family<ThemeData, Brightness>(
  (ref, brightness) => ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      brightness: brightness,
      primarySwatch: Colors.grey,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    ),
  ),
);
