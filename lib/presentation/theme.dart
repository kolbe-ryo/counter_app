import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// テーマプロバイダー
final themeProvider = Provider<ThemeData>(
  (ref) => ThemeData(
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData().copyWith(color: Colors.grey),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    ),
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
  ),
);
