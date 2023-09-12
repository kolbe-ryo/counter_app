import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../util/logger.dart';

abstract class IconInterface {
  void onTap(WidgetRef ref);
}

class AddIconAction implements IconInterface {
  @override
  void onTap(WidgetRef ref) {
    logger.info('ADD');
  }
}

class MenuIconAction implements IconInterface {
  @override
  void onTap(WidgetRef ref) {
    logger.info('MENU');
  }
}
