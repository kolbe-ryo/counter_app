import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../util/datetime_formatter.dart';

part 'updated_datetime_value.freezed.dart';

/// 更新日時オブジェクト
@freezed
class UpdatedDatetimeValue with _$UpdatedDatetimeValue {
  const factory UpdatedDatetimeValue.__({
    required DateTime dateTime,
  }) = _UpdatedDatetimeValue;

  const UpdatedDatetimeValue._();

  factory UpdatedDatetimeValue.now() => UpdatedDatetimeValue.__(dateTime: DateTime.now());

  @override
  String toString() {
    return DateTimeFormatter.formatter(dateTime);
  }
}
