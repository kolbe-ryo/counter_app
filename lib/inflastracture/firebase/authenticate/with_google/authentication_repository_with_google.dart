import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/repository/authentication/authentication_repository.dart';
import 'firebase_authentication_client_with_google.dart';

final firebaseAuthRepositoryWithGoogleProvider = Provider<FirebaseAuthRepositoryWithGoogle>(
  (ref) => FirebaseAuthRepositoryWithGoogle(
    client: ref.watch(firebaseAuthClientWithGoogleProvider),
  ),
);

/// Apple版リポジトリRepository
class FirebaseAuthRepositoryWithGoogle implements AuthenticationRepository {
  const FirebaseAuthRepositoryWithGoogle({required this.client});

  final FirebaseAuthClientWithGoogle client;

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
}
