import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDataRepositoryProvider = Provider<AuthenticationRepository>(
  (ref) => throw UnimplementedError('Provider was not initialized'),
);

/// ユーザー認証リポジトリ
abstract class AuthenticationRepository {
  Future<void> signUp();

  Future<void> signIn();

  Future<void> signOut();
}

abstract class ResetPasswordRepository {
  /// パスワードのリセット
  Future<void> resetPassword();
}
