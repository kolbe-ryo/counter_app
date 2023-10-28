import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../edit/strategy/edit_page_icon_action.dart';
import 'strategy/icon_interface.dart';
import 'strategy/main_page_icon_action.dart';

class MainPageIconButton extends ConsumerWidget {
  const MainPageIconButton._(
    this._conInterface,
    this._iconData,
    this._color,
    this._tooltip,
  );

  factory MainPageIconButton.addNewCard() {
    return MainPageIconButton._(
      AddHeaderIconAction(),
      Icons.add_circle,
      Colors.black,
      'addNewCard',
    );
  }

  factory MainPageIconButton.menu() {
    return MainPageIconButton._(
      MenuHeaderIconAction(),
      Icons.menu,
      Colors.black,
      'menu',
    );
  }

  factory MainPageIconButton.addCount() {
    return MainPageIconButton._(
      AddIconAction(),
      Icons.add,
      Colors.white,
      'addCount',
    );
  }

  factory MainPageIconButton.minusCount() {
    return MainPageIconButton._(
      MinusIconAction(),
      Icons.remove,
      Colors.white,
      'minusCount',
    );
  }

  factory MainPageIconButton.edit() {
    return MainPageIconButton._(
      EditIconAction(),
      Icons.edit,
      Colors.black54,
      'edit',
    );
  }

  factory MainPageIconButton.remove() {
    return MainPageIconButton._(
      RemoveIconAction(),
      Icons.delete,
      Colors.black54,
      'remove',
    );
  }

  factory MainPageIconButton.addCountNoAct() {
    return const MainPageIconButton._(
      null,
      Icons.add,
      Colors.black12,
      'addCountNoAct',
    );
  }

  factory MainPageIconButton.minusCountNoAct() {
    return const MainPageIconButton._(
      null,
      Icons.remove,
      Colors.black12,
      'minusCountNoAct',
    );
  }

  factory MainPageIconButton.editNoAct() {
    return const MainPageIconButton._(
      null,
      Icons.edit,
      Colors.black12,
      'editNoAct',
    );
  }

  factory MainPageIconButton.removeNoAct() {
    return const MainPageIconButton._(
      null,
      Icons.delete,
      Colors.black12,
      'removeNoAct',
    );
  }

  final IconInterface? _conInterface;

  final IconData _iconData;

  final Color _color;

  final String _tooltip;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      tooltip: _tooltip,
      onPressed: () => _conInterface?.onTap(ref),
      icon: Icon(
        _iconData,
        size: 40,
        color: _color,
      ),
    );
  }
}
