import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'entity/counter.dart';

final counterRepositoryProvider = Provider<CounterRepository>(
  (ref) => throw UnimplementedError('Provider was not initialized'),
);

/// カウンタRepository
abstract class CounterRepository {
  /// カウンター一覧を取得する
  Stream<Counter> fetchSnapshot();

  /// カウンターを保存する
  Future<void> saveCounter({
    required Counter counter,
  });
}
