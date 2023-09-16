import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../edit/strategy/edit_page_icon_action.dart';
import '../main/strategy/icon_interface.dart';

class EditPageIconButton extends ConsumerWidget {
  const EditPageIconButton._(
    this._conInterface,
    this._iconData,
    this._color,
  );

  factory EditPageIconButton.edit() {
    return EditPageIconButton._(
      EditIconAction(),
      Icons.edit,
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
