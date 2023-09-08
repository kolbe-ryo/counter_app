import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../../gen/assets.gen.dart';

// TODO: 初期に全てのアニメーションを読み込む処理にする
final lottieCache = Provider<LottieCache>(
  (ref) => LottieCache(),
);

class LottieCache {
  LottieCache() {
    _assets.forEach(add);
  }

  final _assets = [
    Assets.animations.launchApp,
    Assets.animations.signUp,
    Assets.animations.signIn,
  ];

  final Map<String, LottieComposition> _compositions = {};

  static const _topPageAnimaitonSize = Size(200, 200);

  Future<void> add(String assetName) async {
    _compositions[assetName] = await AssetLottie(assetName).load();
  }

  Widget load(String assetName) {
    final composition = _compositions[assetName];
    if (composition != null) {
      return Lottie(
        composition: composition,
        width: _topPageAnimaitonSize.width,
        height: _topPageAnimaitonSize.height,
      );
    } else {
      add(assetName);
      return Lottie.asset(
        assetName,
        width: _topPageAnimaitonSize.width,
        height: _topPageAnimaitonSize.height,
        // repeat: false,
      );
    }
  }
}
