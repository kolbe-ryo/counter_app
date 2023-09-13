import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'strategy/icon_interface.dart';

class MainPageIconButton extends ConsumerWidget {
  const MainPageIconButton._(
    this._conInterface,
    this._iconData,
    this._color,
  );

  factory MainPageIconButton.addNewCard() {
    return MainPageIconButton._(
      AddHeaderIconAction(),
      Icons.add_circle,
      Colors.black,
    );
  }

  factory MainPageIconButton.menu() {
    return MainPageIconButton._(
      MenuHeaderIconAction(),
      Icons.menu,
      Colors.black,
    );
  }

  factory MainPageIconButton.addCount() {
    return MainPageIconButton._(
      AddIconAction(),
      Icons.add,
      Colors.white,
    );
  }

  factory MainPageIconButton.minusCount() {
    return MainPageIconButton._(
      MinusIconAction(),
      Icons.remove,
      Colors.white,
    );
  }

  factory MainPageIconButton.edit() {
    return MainPageIconButton._(
      EditIconAction(),
      Icons.edit,
      Colors.black54,
    );
  }

  factory MainPageIconButton.remove() {
    return MainPageIconButton._(
      RemoveIconAction(),
      Icons.delete,
      Colors.black54,
    );
  }

  final IconInterface _conInterface;

  final IconData _iconData;

  final Color _color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () => _conInterface.onTap(ref),
      icon: Icon(
        _iconData,
        size: 40,
        color: _color,
      ),
    );
  }
}
