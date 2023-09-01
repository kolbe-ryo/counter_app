import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../gen/assets.gen.dart';
import 'lottie_cache.dart';

class AnimationImage extends ConsumerWidget {
  const AnimationImage._(this.assets);

  factory AnimationImage.launchApp() {
    return AnimationImage._(Assets.animations.launchApp);
  }

  factory AnimationImage.signUp() {
    return AnimationImage._(Assets.animations.signUp);
  }

  final String assets;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(lottieCache).load(assets);
  }
}
