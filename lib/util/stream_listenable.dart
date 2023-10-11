import 'dart:async';

import 'package:flutter/foundation.dart';

/// GoRouterでrefreshListenableにStreamを設定するためのラッパークラス
/// https://github.com/flutter/flutter/issues/116651
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
