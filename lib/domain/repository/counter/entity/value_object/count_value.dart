import 'package:freezed_annotation/freezed_annotation.dart';

part 'count_value.freezed.dart';

/// カウント数オブジェクト
@freezed
class CountValue with _$CountValue {
  const factory CountValue([
    @Default(0) int count,
  ]) = _CountValue;

  const CountValue._();

  static const int _upperLimit = 99;
  static const int _lowerLimit = 99;

  /// 上限に達すると上限値を返却する
  CountValue get increment => count == _upperLimit ? copyWith(count: _upperLimit) : copyWith(count: count + 1);

  /// 下限に達すると下限値を返却する
  CountValue get decrement => count == _lowerLimit ? copyWith(count: _lowerLimit) : copyWith(count: count - 1);
}
