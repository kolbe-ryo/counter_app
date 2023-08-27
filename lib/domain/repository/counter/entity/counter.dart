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
    /// カウンター名
    required StringValue name,

    /// カウント数
    required CountValue count,

    /// カテゴリ情報
    required CategoryInfo categoryInfo,

    /// 説明
    String? description,

    /// 更新日時
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
  Counter increment() => copyWith(count: count.increment());

  /// カウントダウン
  Counter decrement() => copyWith(count: count.decrement());
}
