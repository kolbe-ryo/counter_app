import 'package:flutter_riverpod/flutter_riverpod.dart';

/// TODO Authenticateで取得したuserIdに置き換え
final authenticatedUserIdProvider = Provider<String>(
  (ref) => 'test_user_id',
);

/// Firebaseクライアントプロバイダー
final firebaseProvider = Provider<FirebaseFirestore>(
  (ref) => FirebaseFirestore.instance,
);

class FirebaseClientAuthentication {
  const FirebaseClientAuthentication({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  Future<void> signUp() async {}

  Future<void> signIn() async {}

  Future<void> signOut() async {}
}
