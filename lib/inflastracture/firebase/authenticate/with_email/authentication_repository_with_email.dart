import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/repository/authentication/authentication_repository.dart';
import 'firebase_authentication_client_with_email.dart';

final firebaseAuthRepositoryWithEmailProvider = Provider<FirebaseAuthRepositoryWithEmail>(
  (ref) => FirebaseAuthRepositoryWithEmail(
    client: ref.watch(firebaseAuthClientWithEmailProvider),
  ),
);

/// Firebase版リポジトリRepository
class FirebaseAuthRepositoryWithEmail implements AuthenticationRepository, ResetPasswordRepository {
  const FirebaseAuthRepositoryWithEmail({required this.client});

  final FirebaseAuthClientWithEmail client;

  @override
  Future<void> signUp() async {
    await client.signUp();
    // TODO: 認証情報の永続化
  }

  @override
  Future<void> signIn() async {
    await client.signIn();
    // TODO: 認証情報の永続化
  }

  @override
  Future<void> signOut() async {
    await client.signOut();
    // TODO: 認証情報の削除
  }

  @override
  Future<void> resetPassword() async {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> checkAuthState() {
    // TODO: implement checkAuthState
    throw UnimplementedError();
  }
}
