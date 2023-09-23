import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../util/logger.dart';
import '../../../util/text_styles.dart';
import '../../common/buttons/back_app_button.dart';
import '../../constant_value.dart';
import 'menu_card.dart';

class OtherPage extends ConsumerWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(kPadding),
        child: Column(
          children: [
            Row(
              children: [
                _AboutThisApp(),
                _AboutThisApp(),
              ],
            ),
            BackAppButton(),
          ],
        ),
      ),
    );
  }
}

class _AboutThisApp extends StatelessWidget {
  const _AboutThisApp();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: MenuCard.square(
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.apple,
              size: settingIconSize,
            ),
            SizedBox(height: kPadding),
            Text(
              'About Thid App',
              style: TextStyles.largeFontStyle,
            ),
          ],
        ),
        onTap: () => logger.info('tap'),
      ),
    );
  }
}
