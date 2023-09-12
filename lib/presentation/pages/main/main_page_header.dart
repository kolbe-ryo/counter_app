import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../util/logger.dart';
import '../../../util/text_styles.dart';
import '../../constant_value.dart';
import 'strategy/icon_interface.dart';

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
          _HeaderIcon.add(),
          _HeaderIcon.menu(),
          const SizedBox(width: kPadding),
        ],
      ),
    );
  }
}

class _HeaderIcon extends ConsumerWidget {
  const _HeaderIcon._(
    this._conInterface,
    this._iconData,
  );

  factory _HeaderIcon.add() {
    return _HeaderIcon._(
      AddHeaderIconAction(),
      Icons.add_circle,
    );
  }

  factory _HeaderIcon.menu() {
    return _HeaderIcon._(
      MenuHeaderIconAction(),
      Icons.menu,
    );
  }

  final IconInterface _conInterface;

  final IconData _iconData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () => _conInterface.onTap(ref),
      icon: Icon(
        _iconData,
        size: 40,
        color: Colors.black,
      ),
    );
  }
}
