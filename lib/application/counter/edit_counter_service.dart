import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repository/counter/entity/category_info.dart';
import '../../domain/repository/counter/entity/counter.dart';
import 'state/edit_state.dart';

/// EditPageのViewからの操作を受け付けるクラス
final editCounterServiceProvider = Provider(EditCounterService.new);

class EditCounterService {
  const EditCounterService(this.ref);

  final Ref ref;

  /// 名前を変更する
  void changeCounterName({required String name}) {
    ref.read(editCardStateNotifierProvider.notifier).changeCounterName(name);
  }

  /// カテゴリを変更する
  void changeCategory({required CategoryInfo categoryInfo}) {
    ref.read(editCardStateNotifierProvider.notifier).changeCategory(categoryInfo);
  }

  /// 説明を変更する
  void changeDescription({required String? description}) {
    ref.read(editCardStateNotifierProvider.notifier).changeDescription(description);
  }

  void updateState({required Counter counter}) {
    ref.read(editCardStateNotifierProvider.notifier).updateState(counter);
  }
}
