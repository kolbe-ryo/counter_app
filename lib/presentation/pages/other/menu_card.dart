import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constant_value.dart';

class MenuCard extends ConsumerWidget {
  const MenuCard._(
    Widget child,
    void Function() onTap,
  )   : _child = child,
        _onTap = onTap;

  factory MenuCard.common({
    required Widget child,
    double? height = 60,
    required void Function() onTap,
  }) {
    return MenuCard._(
      SizedBox(
        width: double.infinity,
        height: height,
        child: Center(child: child),
      ),
      onTap,
    );
  }

  factory MenuCard.square({
    required Widget child,
    required void Function() onTap,
  }) {
    return MenuCard._(
      AspectRatio(
        aspectRatio: 1,
        child: SizedBox(
          width: double.infinity,
          child: child,
        ),
      ),
      onTap,
    );
  }

  final Widget _child;
  final void Function() _onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 0,
      color: Colors.amber,
      margin: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(kPadding),
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(kPadding),
        onTap: _onTap,
        child: _child,
      ),
    );
  }
}
