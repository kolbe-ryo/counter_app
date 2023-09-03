import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/repository/authentication/authentication_repository.dart';
import '../../../../domain/repository/authentication/entity/authenticate_user_data.dart';
import '../../../../domain/repository/common_object/string_value.dart';
import 'firebase_authentication_client_with_apple.dart';

final firebaseAuthRepositoryWithAppleProvider = Provider<FirebaseAuthRepositoryWithApple>(
  (ref) => FirebaseAuthRepositoryWithApple(
    client: ref.watch(firebaseAuthClientWithAppleProvider),
  ),
);

// TODO: FirebaseAuthRepositoryをFirebaseAuthRepositoryWithGoogleなどを用意すること
/// Apple版リポジトリRepository
class FirebaseAuthRepositoryWithApple implements AuthenticationRepository {
  const FirebaseAuthRepositoryWithApple({required this.client});

  final FirebaseAuthClientWithApple client;

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
  Future<void> resetPassword({required StringValue userData}) async {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }
}
