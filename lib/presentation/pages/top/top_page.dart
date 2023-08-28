import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../../gen/assets.gen.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  static const _topPageAnimaitonSize = Size(200, 200);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            Assets.animations.notFound,
            width: _topPageAnimaitonSize.width,
            height: _topPageAnimaitonSize.height,
          ),
        ],
      ),
    );
  }
}
