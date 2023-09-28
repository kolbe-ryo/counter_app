import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/common_object/string_value.dart';
import '../../../domain/repository/counter/entity/category_info.dart';
import '../../../domain/repository/counter/entity/counter.dart';

final editCardStateNotifierProvider = StateNotifierProvider<EditCardStateNotifier, Counter>(
  (ref) => EditCardStateNotifier(),
);

class EditCardStateNotifier extends StateNotifier<Counter> {
  EditCardStateNotifier() : super(Counter.empty());

  // ignore: use_setters_to_change_properties
  void updateState(Counter counter) {
    state = counter;
  }

  /// 名前を変更する
  void changeCounterName(String name) {
    state = state.copyWith(name: StringValue(name));
  }

  /// カテゴリを変更する
  void changeCategory(CategoryInfo categoryInfo) {
    state = state.copyWith(categoryInfo: categoryInfo);
  }

  /// 説明を変更する
  void changeDescription(String? description) {
    state = state.copyWith(description: description);
  }
}
