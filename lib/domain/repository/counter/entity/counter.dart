import 'package:freezed_annotation/freezed_annotation.dart';

import 'value_object/count_value.dart';
import 'value_object/string_value.dart';
import 'value_object/updated_datetime_value.dart';

part 'counter.freezed.dart';

/// カウンターオブジェクト
@freezed
class Counter with _$Counter {
  const factory Counter({
    required StringValue name,
    required CountValue count,
    String? description,
    required UpdatedDatetimeValue lastUpdated,
  }) = _Counter;

  const Counter._();

  /// ユーザーによる初回作成時のカウンターモデル
  factory Counter.init(
    String name,
    int count,
    String? description,
  ) {
    return Counter(
      name: StringValue(name),
      count: CountValue(count),
      description: description,
      lastUpdated: UpdatedDatetimeValue.now(),
    );
  }
}
