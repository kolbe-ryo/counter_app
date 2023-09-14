import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../util/text_styles.dart';
import '../../constant_value.dart';
import '../../router.dart';

class EditPageHeader extends ConsumerWidget {
  const EditPageHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'EDIT',
            style: TextStyles.largeFontStyle,
          ),
          TextButton(
            onPressed: () => ref.watch(routerProvider).go(MainPageRoute.name),
            child: const Text(
              'Done',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}