import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common_object/string_value.dart';

part 'user_data.freezed.dart';

/// Firebase認証ユーザーオブジェクト
@freezed
class UserData with _$UserData {
  const factory UserData._({
    required StringValue id,
    required StringValue password,
  }) = _UserData;

  factory UserData.create(
    String id,
    String password,
  ) {
    return UserData._(
      id: StringValue(id),
      password: StringValue(password),
    );
  }
}
