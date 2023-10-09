import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../domain/exceptions.dart';
import '../../../../util/logger.dart';
import '../clients.dart';

final firebaseAuthClientWithGoogleProvider = Provider<FirebaseAuthClientWithGoogle>(
  (ref) => FirebaseAuthClientWithGoogle(
    firebaseClient: ref.watch(firebaseAuthProvider),
    googleClient: ref.watch(googleAuthenticatorProvider),
  ),
);

class FirebaseAuthClientWithGoogle {
  const FirebaseAuthClientWithGoogle({
    required this.firebaseClient,
    required this.googleClient,
  });

  final FirebaseAuth firebaseClient;

  final GoogleSignIn googleClient;

  Future<void> signUp() async {
    // TODO: Google ID登録の外部遷移
    logger.info('To external browser for signinig up Google');
  }

  Future<void> signIn() async {
    try {
      final signinAccount = await googleClient.signIn();
      if (signinAccount == null) {
        return;
      }

      // TODO: キャンセル時の対応

      final auth = await signinAccount.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: auth.idToken,
        accessToken: auth.accessToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);

      logger.info('success sign in!');
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
      await firebaseClient.signOut();
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
