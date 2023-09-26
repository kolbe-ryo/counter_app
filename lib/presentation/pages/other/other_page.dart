import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../util/logger.dart';
import '../../../util/text_styles.dart';
import '../../common/buttons/back_app_button.dart';
import '../../constant_value.dart';
import '../../router.dart';
import 'menu_card.dart';
import 'other_page_header.dart';
import 'webview/webview_arguments.dart';

class OtherPage extends ConsumerWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  OtherPageHeader(),
                  Row(
                    children: [
                      _AboutThisApp(),
                      _License(),
                    ],
                  ),
                  _RateApp(),
                  Row(
                    children: [
                      _Contact(),
                      _Reset(),
                    ],
                  ),
                  _CategorySetting(),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: kPadding * 2),
              child: BackAppButton.toMain(),
            ),
          ),
        ],
      ),
    );
  }
}

class _AboutThisApp extends ConsumerWidget {
  const _AboutThisApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Flexible(
      child: MenuCard.square(
        onTap: () => ref.watch(routerProvider).go(
              WebviewRoute.name,
              extra: const WebviewArguments(
                title: 'About App',
                url: aboutAppUrl,
              ),
            ),
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

class _RateApp extends StatelessWidget {
  const _RateApp();

  @override
  Widget build(BuildContext context) {
    return MenuCard.common(
      // TODO: Action
      onTap: () => logger.info('rate app'),
      color: Colors.blueAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.star_rate_rounded,
            color: Colors.white,
            size: settingIconSize,
          ),
          const SizedBox(width: kPadding * 2),
          Text(
            'Rate App',
            style: TextStyles.largeFontStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _Contact extends ConsumerWidget {
  const _Contact();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Flexible(
      flex: 2,
      child: MenuCard.common(
        onTap: () => ref.watch(routerProvider).go(
              WebviewRoute.name,
              extra: const WebviewArguments(
                title: 'Contact',
                url: contactUrl,
              ),
            ),
        color: Colors.cyan,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.mail,
              color: Colors.white,
              size: settingIconSize,
            ),
            const SizedBox(width: kPadding * 2),
            Text(
              'Contact',
              style: TextStyles.largeFontStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class _Reset extends StatelessWidget {
  const _Reset();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: MenuCard.common(
        // TODO: Action
        onTap: () => logger.info('reset'),
        color: Colors.deepOrange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.new_releases_outlined,
              color: Colors.white,
              size: settingIconSize,
            ),
            const SizedBox(width: kPadding),
            Text(
              'Reset',
              style: TextStyles.largeFontStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategorySetting extends StatelessWidget {
  const _CategorySetting();

  @override
  Widget build(BuildContext context) {
    return MenuCard.common(
      // TODO: Action
      onTap: () => logger.info('category setting'),
      color: Colors.purpleAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.palette,
            color: Colors.white,
            size: settingIconSize,
          ),
          const SizedBox(width: kPadding * 2),
          Text(
            'Category Setting',
            style: TextStyles.largeFontStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
