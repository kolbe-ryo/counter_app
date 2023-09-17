import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/counter/entity/counter.dart';

final editCardStateNotifierNotifierProvider = StateNotifierProvider.autoDispose<EditCardStateNotifier, Counter>(
  (ref) => EditCardStateNotifier(),
);

class EditCardStateNotifier extends StateNotifier<Counter> {
  EditCardStateNotifier() : super(Counter.empty());

  /// 名前を変更する
  void changeCounterName(String name) {
    // TODO: List<Couter>の該当のCounterを変更する
  }

  /// カテゴリを変更する
  void changeCategory() {}

  /// 説明を変更する
  void changeDescription() {}
}
