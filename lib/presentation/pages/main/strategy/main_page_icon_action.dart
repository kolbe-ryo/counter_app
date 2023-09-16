import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../util/logger.dart';
import '../../../router.dart';
import 'icon_interface.dart';

class AddHeaderIconAction implements IconInterface {
  @override
  void onTap(WidgetRef ref) {
    logger.info('ADD Header');
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
