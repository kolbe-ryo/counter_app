import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../util/logger.dart';
import '../../../util/text_styles.dart';
import '../../common/buttons/back_app_button.dart';
import '../../constant_value.dart';
import 'menu_card.dart';
import 'other_page_header.dart';

class OtherPage extends ConsumerWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const OtherPageHeader(),
            const Row(
              children: [
                _AboutThisApp(),
                _License(),
              ],
            ),
            const SizedBox(height: kPadding),
            BackAppButton.toMain(),
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
      child: MenuCard.square(
        onTap: () => logger.info('tap'),
        color: Colors.teal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.apple,
              color: Colors.white,
              size: settingIconSize,
            ),
            const SizedBox(height: kPadding),
            Text(
              'About App',
              style: TextStyles.largeFontStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class _License extends StatelessWidget {
  const _License();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: MenuCard.square(
        onTap: () => showLicensePage(context: context),
        color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.description_outlined,
              color: Colors.white,
              size: settingIconSize,
            ),
            const SizedBox(height: kPadding),
            Text(
              'License',
              style: TextStyles.largeFontStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
