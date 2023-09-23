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
      body: CustomScrollView(
        controller: ScrollController(),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            elevation: 0,
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'MENU',
                style: TextStyles.largeFontStyle(),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Row(
              children: [
                _AboutThisApp(),
                _AboutThisApp(),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: BackAppButton(),
          ),
        ],
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
              'About Thid App',
              style: TextStyles.largeFontStyle(color: Colors.white),
            ),
          ],
        ),
        onTap: () => logger.info('tap'),
      ),
    );
  }
}
