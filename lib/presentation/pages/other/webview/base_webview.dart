import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BaseWebview extends StatelessWidget {
  BaseWebview({
    super.key,
    required String title,
    required String url,
  })  : _title = title,
        _uri = Uri.parse(url);

  final String _title;
  final Uri _uri;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title,
          style: const TextStyle(color: Colors.black54),
        ),
      ),
      body: WebViewWidget(
        controller: WebViewController()..loadRequest(_uri),
      ),
    );
  }
}
