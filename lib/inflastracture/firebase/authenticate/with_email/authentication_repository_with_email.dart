import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/repository/authentication/authentication_repository.dart';
import '../../../../domain/repository/authentication/entity/authenticate_user_data.dart';
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
  Future<void> signUp({required AuthenticateUserData userData}) async {
    await client.signUp();
  }

  @override
  Future<void> signIn({required AuthenticateUserData userData}) async {
    await client.signIn();
  }

  @override
  Future<void> signOut({required AuthenticateUserData userData}) async {
    await client.signOut();
  }

  @override
  Future<void> resetPassword({required AuthenticateUserData userData}) async {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> checkAuthState({required AuthenticateUserData userData}) {
    // TODO: implement checkAuthState
    throw UnimplementedError();
  }
}
