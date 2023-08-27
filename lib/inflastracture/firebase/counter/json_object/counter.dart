import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter.freezed.dart';
part 'counter.g.dart';

/// リポジトリJsonObject
@freezed
class CounterJsonObject with _$CounterJsonObject {
  const factory CounterJsonObject({
    /// カウンター名
    @JsonKey(name: 'name') required String name,

    /// カウント数
    @JsonKey(name: 'count') required int count,

    /// カテゴリ情報
    @JsonKey(name: 'cagegory') required String category,

    /// 説明
    String? description,

    /// 更新日時
    @JsonKey(name: 'updatedAt') required Timestamp updatedAt,
  }) = _CounterJsonObject;

  factory CounterJsonObject.fromJson(Map<String, dynamic> json) => _$CounterJsonObjectFromJson(json);
}
