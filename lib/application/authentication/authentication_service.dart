import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repository/authentication/authentication_repository.dart';
import '../../domain/repository/authentication/entity/authenticate_user_data.dart';

/// リポジトリ一覧サービスプロバイダー
final authenticationServiceProvider = Provider.family<AuthenticationService, AuthenticationRepository>((ref, auth) {
  return AuthenticationService(repo: auth);
});

class AuthenticationService {
  const AuthenticationService({required this.repo});

  final AuthenticationRepository repo;

  Future<void> signIn() async {
    await repo.signIn(userData: AuthenticateUserData.create('test11', 'test22'));
  }
}
