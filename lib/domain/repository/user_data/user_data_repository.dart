import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common_object/string_value.dart';
import 'entity/authenticate_user_data.dart';

final userDataRepositoryProvider = Provider<AuthenticationRepository>(
  (ref) => throw UnimplementedError('Provider was not initialized'),
);

/// ユーザー認証リポジトリ
abstract class AuthenticationRepository {
  /// Emailで利用登録を行う
  Future<void> signUp({
    // TODO: 認証に必要な情報を渡す
    required AuthenticateUserData userData,
  });

  /// Emailでサインインする
  Future<void> signIn({
    // TODO: 認証に必要な情報を渡す
    required AuthenticateUserData userData,
  });

  /// サインアウトする
  Future<void> signOut({
    // TODO: 認証に必要な情報を渡す
    required AuthenticateUserData userData,
  });

  /// Passwordのリセット案内をEmailに送信する
  Future<void> resetPassword({
    // TODO: 認証に必要な情報を渡す
    required StringValue userData,
  });
}
