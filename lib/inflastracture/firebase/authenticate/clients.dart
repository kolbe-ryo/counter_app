import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

/// Firebaseクライアントプロバイダー
final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) => FirebaseAuth.instance,
);

/// Auth監視StreamProvider
final firebaseUserStreamProvider = StreamProvider<User?>((ref) async* {
  final userStream = ref.watch(firebaseAuthProvider).authStateChanges();
  await for (final user in userStream) {
    yield user;
  }
});

/// GoogleSingInクライアントプロバイダー
const _googleAuthenticateType = 'email';
const _googleAuthUrl = 'https://www.googleapis.com/auth/contacts.readonly';

final googleAuthenticatorProvider = Provider<GoogleSignIn>(
  (ref) {
    return GoogleSignIn(
      scopes: [
        _googleAuthenticateType,
        _googleAuthUrl,
      ],
    );
  },
);

/// AppleSignInクライアントプロバイダー
const appleAuthenticateType = AppleIDAuthorizationScopes.email;
const appleAuthUrl = AppleIDAuthorizationScopes.fullName;
final appleAuthenticatorProvider = Provider<SignInWithApple>(
  (ref) {
    return SignInWithApple();
  },
);
