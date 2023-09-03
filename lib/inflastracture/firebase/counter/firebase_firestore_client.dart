import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/exceptions.dart';
import '../../../util/logger.dart';
import '../authenticate/with_email/firebase_authentication_client_with_email.dart';

/// Firebaseクライアントプロバイダー
final firebaseFirestoreProvider = Provider<FirebaseFirestore>(
  (ref) => FirebaseFirestore.instance,
);

final firebaseFirestoreClientProvider = Provider<FirebaseFirestoreClient>(
  (ref) => FirebaseFirestoreClient(
    userId: ref.watch(authenticatedUserIdProvider),
    client: ref.watch(firebaseFirestoreProvider),
  ),
);

class FirebaseFirestoreClient {
  const FirebaseFirestoreClient({
    required this.userId,
    required this.client,
  });

  final String userId;
  final FirebaseFirestore client;

  static const _rootCollection = 'users';
  static const _counterCollection = 'user_counters';

  Stream<T> get<T>({
    required Stream<T> Function(Stream<QuerySnapshot>) responseBuilder,
  }) {
    try {
      logger.info('Get documents: user: $userId');
      final response = client.collection(_rootCollection).doc(userId).collection(_counterCollection).snapshots();
      return responseBuilder(response);
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
