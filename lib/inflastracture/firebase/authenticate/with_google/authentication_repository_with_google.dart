import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/repository/authentication/authentication_repository.dart';
import '../../../../domain/repository/authentication/entity/authenticate_user_data.dart';
import 'firebase_authentication_client_with_google.dart';

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
    // TODO: 他に処理がある場合はクライアントではなくこちらに記載すること
    await client.signUp();
  }

  @override
  Future<void> signIn({required AuthenticateUserData userData}) async {
    await client.signIn();
  }

  @override
  Future<void> signOut() async {
    await client.signOut();
  }

  @override
  Future<void> checkAuthState({required AuthenticateUserData userData}) {
    // TODO: implement checkAuthState
    throw UnimplementedError();
  }
}
