import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../util/logger.dart';
import '../../../util/text_styles.dart';
import '../../constant_value.dart';
import 'strategy/header_icon_interface.dart';

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
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'COUNTERS',
            style: TextStyles.largeFontStyle,
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
          _HeaderIcon.add(onTap: AddIconAction()),
          _HeaderIcon.menu(onTap: MenuIconAction()),
          const SizedBox(width: kPadding),
        ],
      ),
    );
  }
}

class _HeaderIcon extends ConsumerWidget {
  const _HeaderIcon._(
    this._headerIconInterface,
    this._iconData,
  );

  factory _HeaderIcon.add({required HeaderIconInterface onTap}) {
    return _HeaderIcon._(
      onTap,
      Icons.add_circle,
    );
  }

  factory _HeaderIcon.menu({required HeaderIconInterface onTap}) {
    return _HeaderIcon._(
      onTap,
      Icons.menu,
    );
  }

  final HeaderIconInterface _headerIconInterface;

  final IconData _iconData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () => _headerIconInterface.onTap(ref),
      icon: Icon(
        _iconData,
        size: 40,
        color: Colors.black,
      ),
    );
  }
}
