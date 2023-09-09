import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../util/logger.dart';

abstract class HeaderIconInterface {
  void onTap(WidgetRef ref);
}

class AddIconAction implements HeaderIconInterface {
  @override
  void onTap(WidgetRef ref) {
    logger.info('ADD');
  }
}

class MenuIconAction implements HeaderIconInterface {
  @override
  void onTap(WidgetRef ref) {
    logger.info('MENU');
  }
}
