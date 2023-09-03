import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/repository/common_object/string_value.dart';
import '../../../../domain/repository/user_data/entity/authenticate_user_data.dart';
import '../../../../domain/repository/user_data/user_data_repository.dart';
import '../firebase_authentication_client.dart';

final firebaseAuthRepositoryWithEmailProvider = Provider<FirebaseAuthRepositoryWithEmail>(
  (ref) => FirebaseAuthRepositoryWithEmail(
    client: ref.watch(firebaseAuthClientWithEmailProvider),
  ),
);

// TODO: FirebaseAuthRepositoryをFirebaseAuthRepositoryWithGoogleなどを用意すること
/// Firebase版リポジトリRepository
class FirebaseAuthRepositoryWithEmail implements AuthenticationRepository {
  const FirebaseAuthRepositoryWithEmail({required this.client});

  final FirebaseAuthClientWithEmail client;

  @override
  Future<void> signUp({required AuthenticateUserData userData}) async {
    await client.signUp();
  }

  // TODO: 以下のメソッドを全て変更する
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
