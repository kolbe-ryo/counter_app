import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'entity/authenticate_user_data.dart';

final userDataRepositoryProvider = Provider<AuthenticationRepository>(
  (ref) => throw UnimplementedError('Provider was not initialized'),
);

/// ユーザー認証リポジトリ
abstract class AuthenticationRepository {
  Future<void> signUp({
    // TODO: 認証に必要な情報を渡す
    required AuthenticateUserData userData,
  });

  Future<void> signIn({
    // TODO: 認証に必要な情報を渡す
    required AuthenticateUserData userData,
  });

  Future<void> signOut({
    // TODO: 認証に必要な情報を渡す
    required AuthenticateUserData userData,
  });

  /// 認証状態を確認する
  Future<void> checkAuthState({
    // TODO: 認証に必要な情報を渡す
    required AuthenticateUserData userData,
  });
}

abstract class ResetPasswordRepository {
  /// パスワードのリセット
  Future<void> resetPassword({
    // TODO: 認証に必要な情報を渡す
    required AuthenticateUserData userData,
  });
}
