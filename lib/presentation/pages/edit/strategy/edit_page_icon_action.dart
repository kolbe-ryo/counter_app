import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../util/logger.dart';
import '../../main/strategy/icon_interface.dart';
import '../edit_page.dart';

class EditIconAction implements IconInterface {
  @override
  Future<void> onTap(WidgetRef ref) async {
    final result = await showCupertinoModalBottomSheet<bool?>(
      duration: const Duration(milliseconds: 200),
      context: ref.context,
      builder: (_) => const EditPage(),
    );
    logger.info(result);
  }
}

class RemoveIconAction implements IconInterface {
  @override
  void onTap(WidgetRef ref) {
    logger.info('REMOVE');
  }
}
