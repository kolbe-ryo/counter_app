import 'package:riverpod/riverpod.dart';

import 'entity/counter.dart';

final counterRepositoryProvider = Provider<CounterRepository>(
  (ref) => throw UnimplementedError('Provider was not initialized'),
);

/// カウンタRepository
abstract class CounterRepository {
  /// カウンター一覧を取得する
  Future<Counter> getCounters({
    // TODO: 認証に必要な情報を渡す
    required String ownerName,
  });

  Future<void> saveCounters({
    // TODO: 認証に必要な情報を渡す
    required Counter counter,
  });
}
