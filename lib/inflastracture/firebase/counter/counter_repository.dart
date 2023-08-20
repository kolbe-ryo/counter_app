import '../../../domain/repository/counter/counter_repository.dart';
import '../../../domain/repository/counter/entity/category_info.dart';
import '../../../domain/repository/counter/entity/counter.dart';
import '../firebase_client.dart';

/// GitHub版リポジトリRepository
class FirebaseFirestoreRepository implements CounterRepository {
  const FirebaseFirestoreRepository({required this.client});

  final FirebaseClient client;

  @override
  Stream<Counter> fetchCounters() {
    /// カウンターのStreamを取得する
    return client.get<Counter>(
      responseBuilder: (data) async* {
        yield Counter.init('test', CategoryInfo(), 1, null);
      },
    );
  }

  @override
  Future<void> saveCounter({required Counter counter}) async {
    // TODO: implement saveCounters
    throw UnimplementedError();
  }
}
