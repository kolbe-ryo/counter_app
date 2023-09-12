class MainPageIconButton extends ConsumerWidget {
  const MainPageIconButton._(
    this._conInterface,
    this._iconData,
  );

  factory MainPageIconButton.add() {
    return MainPageIconButton._(
      AddHeaderIconAction(),
      Icons.add_circle,
    );
  }

  factory MainPageIconButton.menu() {
    return MainPageIconButton._(
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
