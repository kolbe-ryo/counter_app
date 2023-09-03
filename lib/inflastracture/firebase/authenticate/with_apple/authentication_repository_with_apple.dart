import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/repository/authentication/authentication_repository.dart';
import '../../../../domain/repository/authentication/entity/authenticate_user_data.dart';
import 'firebase_authentication_client_with_apple.dart';

final firebaseAuthRepositoryWithGoogleProvider = Provider<FirebaseAuthRepositoryWithGoogle>(
  (ref) => FirebaseAuthRepositoryWithGoogle(
    client: ref.watch(firebaseAuthClientWithGoogleProvider),
  ),
);

// TODO: FirebaseAuthRepositoryをFirebaseAuthRepositoryWithGoogleなどを用意すること
/// Apple版リポジトリRepository
class FirebaseAuthRepositoryWithGoogle implements AuthenticationRepository {
  const FirebaseAuthRepositoryWithGoogle({required this.client});

  final FirebaseAuthClientWithGoogle client;

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
  Future<void> checkAuthState({required AuthenticateUserData userData}) {
    // TODO: implement checkAuthState
    throw UnimplementedError();
  }
}