import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/common_object/string_value.dart';
import '../../../domain/repository/user_data/entity/authenticate_user_data.dart';
import '../../../domain/repository/user_data/user_data_repository.dart';
import 'firebase_authentication_client.dart';

final firebaseAuthRepositoryProvider = Provider<FirebaseAuthRepository>(
  (ref) => FirebaseAuthRepository(
    client: ref.watch(firebaseAuthClientProvider),
  ),
);

/// Firebase版リポジトリRepository
class FirebaseAuthRepository implements AuthenticationRepository {
  const FirebaseAuthRepository({required this.client});

  final FirebaseAuthClient client;

  @override
  Future<void> signIn({required AuthenticateUserData userData}) async {
    await client.signIn();
  }

  @override
  Future<void> signOut({required AuthenticateUserData userData}) async {
    await client.signOut();
  }

  @override
  Future<void> signUp({required AuthenticateUserData userData}) async {
    await client.signUp();
  }

  @override
  Future<void> resetPassword({required StringValue userData}) async {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }
}
