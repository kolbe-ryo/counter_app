import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../router.dart';
import 'app_button.dart';
import 'app_only_text_button.dart';

class BackAppButton extends ConsumerWidget {
  const BackAppButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton.largeWidth(
      appButtonStyle: AppOnlyTextButton(
        backgroundColor: Colors.blueGrey,
        buttonName: 'Go Back',
        onPressed: () => ref.watch(routerProvider).go(TopPageRoute.name),
      ),
    );
  }
}
