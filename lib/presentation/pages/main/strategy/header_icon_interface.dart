import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../util/logger.dart';

abstract class IconInterface {
  void onTap(WidgetRef ref);
}

class AddHeaderIconAction implements IconInterface {
  @override
  void onTap(WidgetRef ref) {
    logger.info('ADD Header');
  }
}

class MenuHeaderIconAction implements IconInterface {
  @override
  void onTap(WidgetRef ref) {
    logger.info('MENU Header');
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
