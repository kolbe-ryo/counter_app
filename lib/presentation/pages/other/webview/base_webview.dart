import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BaseWebview extends StatelessWidget {
  const BaseWebview({super.key});

  static const _aboutAppUrl = 'https://kolbe-app.site/';

  static final Uri _aboutAppUri = Uri.parse(_aboutAppUrl);

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: WebViewController()..loadRequest(_aboutAppUri),
    );
  }
}
