import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/exceptions.dart';
import '../../util/logger.dart';

class FirebaseClient {
  const FirebaseClient({
    required this.userId,
  });

  final String userId;

  static const _rootCollection = 'users';
  static const _counterCollection = 'user_counters';

  Stream<dynamic> snapShot() {
    try {
      logger.info('Get documents: user: $userId');
      final client = FirebaseFirestore.instance;
      final response = client.collection(_rootCollection).doc(userId).collection(_counterCollection).snapshots();
      // TODO jsonを変換する
      return response;
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
