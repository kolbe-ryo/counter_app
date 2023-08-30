import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../gen/assets.gen.dart';
import '../../common/lottie_cache.dart';

class TopPageImage extends ConsumerWidget {
  const TopPageImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(lottieCache).load(Assets.animations.launchApp);
  }
}
