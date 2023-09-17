import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'state/edit_state.dart';

/// EditPageのViewからの操作を受け付けるクラス

class EditCounterService {
  const EditCounterService(this.ref);

  final Ref ref;

  /// 名前を変更する
  void changeCounterName({required String name}) {
    ref.read(editCardStateNotifierNotifierProvider.notifier).changeCounterName(name);
  }

  /// カテゴリを変更する
  void changeCategory() {}

  /// 説明を変更する
  void changeDescription() {}
}
