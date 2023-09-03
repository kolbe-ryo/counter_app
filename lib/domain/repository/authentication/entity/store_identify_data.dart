import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common_object/string_value.dart';

part 'store_identify_data.freezed.dart';

/// FireStoreのユーザーデータ識別用のuid格納クラス
@freezed
class StoreIdentifyData with _$StoreIdentifyData {
  factory StoreIdentifyData(String id) => StoreIdentifyData._(id: StringValue(id));

  const factory StoreIdentifyData._({
    required StringValue id,
  }) = _StoreIdentifyData;
}
