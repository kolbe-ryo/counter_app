import 'package:email_validator/email_validator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../exceptions.dart';
import '../../common_object/string_value.dart';

part 'authenticate_user_data.freezed.dart';

/// Firebase認証ユーザーオブジェクト
/// emailはEmailValidatorでチェックするので、StringValueによるチェックは不要
@freezed
class AuthenticateUserData with _$AuthenticateUserData {
  const factory AuthenticateUserData._({
    required String email,
    required StringValue password,
  }) = _AuthenticateUserData;

  factory AuthenticateUserData.create(
    String email,
    String password,
  ) {
    /// メール形式が正確か
    if (EmailValidator.validate(email)) {
      throw ValidatorException.invalidEmail();
    }

    /// パスワードが6文字以上か
    if (!_regExp.hasMatch(password)) {
      throw ValidatorException.invalidPassword();
    }

    /// エラーが発生しない場合、データを詰める
    return AuthenticateUserData._(
      email: email,
      password: StringValue(password),
    );
  }

  /// 6文字以上の英数字
  static const String _pattern = r'^[a-zA-Z0-9]{6,}$';

  static final RegExp _regExp = RegExp(_pattern);
}
