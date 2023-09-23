import 'package:flutter/material.dart';

import '../../../util/logger.dart';
import '../../../util/text_styles.dart';
import '../../constant_value.dart';
import 'main_page_icon_button.dart';

class MainPageHeader extends StatelessWidget {
  const MainPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: SliverAppBar(
        automaticallyImplyLeading: false,
        pinned: true,
        elevation: 0,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'COUNTERS',
            style: TextStyles.largeFontStyle(),
          ),
        ),
        bottom: TabBar(
          isScrollable: true,
          labelColor: Colors.pinkAccent,
          onTap: logger.info,
          tabs: const [
            Tab(text: 'ALL'),
            Tab(text: 'BREAD'),
            Tab(text: 'EGG'),
            Tab(text: 'SPONGE'),
            Tab(text: 'NOTE'),
            Tab(text: 'BEER'),
            Tab(text: 'COKE'),
          ],
          indicatorColor: Colors.transparent,
          unselectedLabelColor: Colors.grey,
          labelStyle: TextStyles.middleFontStyle,
        ),
        actions: [
          MainPageIconButton.addNewCard(),
          MainPageIconButton.menu(),
          const SizedBox(width: kPadding),
        ],
      ),
    );
  }
}
