import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../exceptions.dart';

part 'string_value.freezed.dart';

/// ドメイン用文字列オブジェクト
@freezed
class StringValue with _$StringValue {
  factory StringValue([
    @Default('') String value,
  ]) = _StringValue;

  StringValue._() {
    // 前後に空白があったらエラーにする
    if (value.length != value.trim().length) {
      throw ValidatorException.invalidArgument();
    }
    // 空文字はエラーにする
    if (value.isEmpty) {
      throw ValidatorException.invalidArgument();
    }
  }
}
