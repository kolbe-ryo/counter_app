import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common_object/string_value.dart';
import 'category_info.dart';
import 'value_object/count_value.dart';
import 'value_object/updated_datetime_value.dart';

part 'counter.freezed.dart';

/// カウンターオブジェクト
@freezed
class Counter with _$Counter {
  const factory Counter({
    required StringValue name,
    required CountValue count,
    required CategoryInfo categoryInfo,
    String? description,
    required UpdatedDatetimeValue lastUpdated,
  }) = _Counter;

  const Counter._();

  /// ユーザーによる初回作成時のカウンターモデル
  factory Counter.init(
    String name,
    CategoryInfo category,
    int count,
    String? description,
  ) {
    return Counter(
      name: StringValue(name),
      count: CountValue(count),
      categoryInfo: category,
      description: description,
      lastUpdated: UpdatedDatetimeValue.now(),
    );
  }

  /// カウントアップ
  Counter get increment => copyWith(count: count.increment);

  /// カウントダウン
  Counter get decrement => copyWith(count: count.decrement);
}
