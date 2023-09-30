import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/common_object/string_value.dart';
import '../../../domain/repository/counter/entity/category_info.dart';
import '../../../domain/repository/counter/entity/counter.dart';

final editCardStateNotifierProvider = StateNotifierProvider<EditCardStateNotifier, Counter>(
  // TODO: この変更を通知して、MainPageのCounter側を変更する
  (ref) => EditCardStateNotifier(),
);

abstract class EditCardStateInterface {
  void updateState(Counter counter);
  void changeCounterName(String name);
  void changeCategory(CategoryInfo categoryInfo);
  void changeDescription(String? description);
}

class EditCardStateNotifier extends StateNotifier<Counter> implements EditCardStateInterface {
  EditCardStateNotifier() : super(Counter.empty());

  // ignore: use_setters_to_change_properties
  @override
  void updateState(Counter counter) {
    state = counter;
  }

  /// 名前を変更する
  @override
  void changeCounterName(String name) {
    state = state.copyWith(name: StringValue(name));
  }

  /// カテゴリを変更する
  @override
  void changeCategory(CategoryInfo categoryInfo) {
    state = state.copyWith(categoryInfo: categoryInfo);
  }

  /// 説明を変更する
  @override
  void changeDescription(String? description) {
    state = state.copyWith(description: description);
  }
}
