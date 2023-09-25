import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BaseWebview extends StatelessWidget {
  BaseWebview({
    super.key,
    required String url,
  }) : _uri = Uri.parse(url);

  final Uri _uri;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(
        controller: WebViewController()..loadRequest(_uri),
      ),
    );
  }
}
