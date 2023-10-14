import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/repository/authentication/authentication_repository.dart';
import 'firebase_authentication_client_with_apple.dart';

final firebaseAuthRepositoryWithAppleProvider = Provider<FirebaseAuthRepositoryWithApple>(
  (ref) => FirebaseAuthRepositoryWithApple(
    client: ref.watch(firebaseAuthClientWithAppleProvider),
  ),
);

// TODO: FirebaseAuthRepositoryをFirebaseAuthRepositoryWithAppleなどを用意すること
/// Apple版リポジトリRepository
class FirebaseAuthRepositoryWithApple implements AuthenticationRepository {
  const FirebaseAuthRepositoryWithApple({required this.client});

  final FirebaseAuthClientWithApple client;

  @override
  Future<void> signUp() async {
    await client.signUp();
  }

  @override
  Future<void> signIn() async {
    await client.signIn();
  }

  @override
  Future<void> signOut() async {
    await client.signOut();
  }

  @override
  Future<void> checkAuthState() {
    // TODO: implement checkAuthState
    throw UnimplementedError();
  }
}
