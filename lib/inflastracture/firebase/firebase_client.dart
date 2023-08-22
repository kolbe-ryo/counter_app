import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/exceptions.dart';
import '../../util/logger.dart';

/// TODO Authenticateで取得したuserIdに置き換え
final authenticatedUserIdProvider = Provider<String>(
  (ref) => 'test_user_id',
);

/// Firebaseクライアントプロバイダー
final firebaseProvider = Provider<FirebaseFirestore>(
  (ref) => FirebaseFirestore.instance,
);

final firebaseClientProvider = Provider<FirebaseClient>(
  (ref) => FirebaseClient(
    userId: ref.watch(authenticatedUserIdProvider),
    client: ref.watch(firebaseProvider),
  ),
);

class FirebaseClient {
  const FirebaseClient({
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
      final client = FirebaseFirestore.instance;
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
