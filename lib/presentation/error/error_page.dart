import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorPage extends ConsumerWidget {
  const ErrorPage(this.error, {super.key});

  /// 例外
  final Exception? error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Text('Error page'),
      ),
    );
  }
}
