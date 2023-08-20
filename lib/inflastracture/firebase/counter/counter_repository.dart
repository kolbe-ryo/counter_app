import 'package:riverpod/riverpod.dart';

import '../../../domain/repository/counter/counter_repository.dart';
import '../../../domain/repository/counter/entity/category_info.dart';
import '../../../domain/repository/counter/entity/counter.dart';
import '../firebase_client.dart';

final firebaseFirestoreRepositoryProvider = Provider<FirebaseFirestoreRepository>(
  (ref) => FirebaseFirestoreRepository(
    client: ref.watch(firebaseClientProvider),
  ),
);

/// Firebase版リポジトリRepository
class FirebaseFirestoreRepository implements CounterRepository {
  const FirebaseFirestoreRepository({required this.client});

  final FirebaseClient client;

  @override
  Stream<Counter> fetchSnapshot() {
    /// カウンターのStreamを取得する
    return client.get<Counter>(
      responseBuilder: (stream) async* {
        await for (final data in stream) {
          // TODO: dataを加工して、Counterに詰め替える
          yield Counter.init('test', CategoryInfo(), 1, null);
        }
      },
    );
  }

  @override
  Future<void> saveCounter({required Counter counter}) async {
    // TODO: implement saveCounters
    throw UnimplementedError();
  }
}
