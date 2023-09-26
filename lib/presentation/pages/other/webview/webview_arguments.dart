import 'package:freezed_annotation/freezed_annotation.dart';

part 'webview_arguments.freezed.dart';

@freezed
class WebviewArguments with _$WebviewArguments {
  const factory WebviewArguments({
    required String title,
    required String url,
  }) = _WebviewArguments;

  const WebviewArguments._();
}
