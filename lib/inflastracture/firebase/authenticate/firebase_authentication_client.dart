import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/exceptions.dart';
import '../../../util/logger.dart';

/// TODO Authenticateで取得したuserIdに置き換え
final authenticatedUserIdProvider = Provider<String>(
  (ref) => 'test_user_id',
);

/// Firebaseクライアントプロバイダー
final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) => FirebaseAuth.instance,
);

final firebaseAuthClientProvider = Provider<FirebaseAuthClient>(
  (ref) => FirebaseAuthClient(
    email: '',
    password: '',
    client: ref.watch(firebaseAuthProvider),
  ),
);

class FirebaseAuthClient {
  const FirebaseAuthClient({
    required this.email,
    required this.password,
    required this.client,
  });

  final String email;
  final String password;
  final FirebaseAuth client;

  /// Sign Up
  Future<void> signUpWithEmail() async {
    try {
      await client.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      logger.info('success sign up!');
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

  Future<void> signUpWithGoogle() async {}

  /// Sign In
  Future<void> signIn() async {
    try {
      await client.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
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
