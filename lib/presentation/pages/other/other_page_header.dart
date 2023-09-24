import 'package:flutter/material.dart';

import '../../../util/text_styles.dart';

class OtherPageHeader extends StatelessWidget implements PreferredSizeWidget {
  const OtherPageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'MENU',
          style: TextStyles.largeFontStyle(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(30);
}
