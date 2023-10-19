import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repository/authentication/authentication_repository.dart';
import '../../inflastracture/firebase/authenticate/authenticate_enum.dart';
import '../../inflastracture/firebase/authenticate/with_apple/authentication_repository_with_apple.dart';
import '../../inflastracture/firebase/authenticate/with_email/authentication_repository_with_email.dart';
import '../../inflastracture/firebase/authenticate/with_google/authentication_repository_with_google.dart';

/// リポジトリ一覧サービスプロバイダー
final authenticationServiceProvider = Provider.family<AuthenticationService, AuthenticationMethod>((ref, authMethod) {
  switch (authMethod) {
    // そもそも分ける必要ない？抽象クラスを受け取るようにしていれば問題なさそう
    case AuthenticationMethod.email:
      return AuthenticationService(repo: ref.watch(firebaseAuthRepositoryWithEmailProvider));
    case AuthenticationMethod.apple:
      return AuthenticationService(repo: ref.watch(firebaseAuthRepositoryWithAppleProvider));
    case AuthenticationMethod.google:
      return AuthenticationService(repo: ref.watch(firebaseAuthRepositoryWithGoogleProvider));
  }
});

class AuthenticationService {
  const AuthenticationService({required this.repo});

  final AuthenticationRepository repo;

  Future<void> signIn() async {
    await repo.signIn();
  }

  Future<void> signOut() async {
    await repo.signOut();
  }
}
