import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../exceptions.dart';

part 'category_info.freezed.dart';

/// カテゴリオブジェクト
@freezed
class CategoryInfo with _$CategoryInfo {
  factory CategoryInfo([
    @Default('') String name,
    @Default(Colors.white) Color color,
  ]) = _CategoryInfo;

  CategoryInfo._() {
    // 前後に空白があったらエラーにする
    if (name.length != name.trim().length) {
      throw ValidatorException.invalidArgument();
    }
    // 空文字はエラーにする
    if (name.isEmpty) {
      throw ValidatorException.invalidArgument();
    }
  }
}
