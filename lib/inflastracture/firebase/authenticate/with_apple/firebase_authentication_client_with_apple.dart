import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../domain/exceptions.dart';
import '../../../../util/logger.dart';
import '../clients.dart';

final firebaseAuthClientWithAppleProvider = Provider<FirebaseAuthClientWithApple>(
  (ref) => FirebaseAuthClientWithApple(
    client: ref.watch(firebaseAuthProvider),
  ),
);

class FirebaseAuthClientWithApple {
  const FirebaseAuthClientWithApple({
    required this.client,
  });

  final FirebaseAuth client;

  static const _appleAuthDomain = 'apple.com';

  Future<void> signUp() async {
    // TODO: Apple ID登録の外部遷移
    logger.info('To external browser for signinig up Apple');
  }

  Future<void> signIn() async {
    try {
      final rawNonce = generateNonce();
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final oauthCredential = OAuthProvider(_appleAuthDomain).credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      // TODO: この値を返却して永続化のリポジトリに通知する方法を検討する
      await client.signInWithCredential(oauthCredential);

      logger.info('success sign in!');
    } on SignInWithAppleException catch (error) {
      logger.info(error);
      // TODO: Exceptionを作成しスローする
    } on FirebaseException catch (error) {
      logger.info(error);
      throw FirebaseNetworkException(
        error.code,
        error.message,
      );
    } on SocketException catch (error) {
      logger.info(error);
      throw FirebaseNetworkException.noInternetConnection();
    }
  }

  Future<void> signOut() async {
    try {
      // TODO: この値を返却して永続化のリポジトリに通知する方法を検討する（削除）
      await client.signOut();
      logger.info('success sign out!');
    } on FirebaseException catch (error) {
      logger.info(error);
      throw FirebaseNetworkException(
        error.code,
        error.message,
      );
    } on SocketException catch (error) {
      logger.info(error);
      throw FirebaseNetworkException.noInternetConnection();
    }
  }
}
