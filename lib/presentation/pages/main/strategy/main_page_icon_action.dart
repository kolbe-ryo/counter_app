import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../application/counter/state/edit_state.dart';
import '../../../../domain/repository/counter/entity/counter.dart';
import '../../../../util/logger.dart';
import '../../../router.dart';
import '../../edit/edit_page.dart';
import 'icon_interface.dart';

class AddHeaderIconAction implements IconInterface {
  @override
  Future<void> onTap(WidgetRef ref) async {
    ref.read(editCardStateNotifierProvider.notifier).updateState(Counter.empty());
    // TODO: 戻った時に登録するか決める
    await showCupertinoModalBottomSheet<bool?>(
      duration: const Duration(milliseconds: 200),
      context: ref.context,
      builder: (_) => const EditPage(),
    );
  }
}

class MenuHeaderIconAction implements IconInterface {
  @override
  void onTap(WidgetRef ref) {
    ref.watch(routerProvider).go(OtherPageRoute.name);
  }
}

class AddIconAction implements IconInterface {
  @override
  void onTap(WidgetRef ref) {
    logger.info('ADD');
  }
}

class MinusIconAction implements IconInterface {
  @override
  void onTap(WidgetRef ref) {
    logger.info('MINUS');
  }
}
