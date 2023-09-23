import 'package:flutter/material.dart';

import '../../../util/text_styles.dart';

class OtherPageHeader extends StatelessWidget {
  const OtherPageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
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
}
