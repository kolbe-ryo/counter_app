import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main_page.dart';

final sliverListDelegateServiceProvider = Provider.autoDispose<SliverListDelegateService>(
  (ref) => SliverListDelegateService(),
);

class SliverListDelegateService {
  SliverListDelegateService();

  bool _tapDetection = true;

  /// アニメーション（TransitionとOpacity）が発動する範囲 0~XXを定める
  static const _scrollEffectDistance = 100;

  bool get tapDetection => _tapDetection;

  // カードが最上部付近までスクロールされた時点で下方向にOffsetするアニメーション計算ロジック
  Offset fadeOutTranslation({
    required int index,
    required double offsetY,
  }) {
    // カードの固有変数
    var fadeOutTranslation = Offset.zero;
    // （タブバーからの距離）=（カードのホームポジション）-(スクロール距離）+（アニメーション範囲）
    final distanceFromTop = index * unwrapCardArea - offsetY + _scrollEffectDistance;

    // カードがアニメーション範囲に到達したら、上にスクロールしないようにカードを下方向に少しずつOffset
    if (distanceFromTop < _scrollEffectDistance) {
      fadeOutTranslation = Offset(0, _scrollEffectDistance - distanceFromTop);
      _tapDetection = false;
    } else {
      _tapDetection = true;
    }
    return fadeOutTranslation;
  }

  // カードが最上部付近までスクロールされた時点で横幅が圧縮され、Opacityで消えていくアニメーション計算ロジック
  double fadeAnimationValue({
    required int index,
    required double offsetY,
  }) {
    // （タブバーからの距離）=（カードのホームポジション）-(スクロール距離）+（アニメーション範囲）
    final distanceFromTop = index * unwrapCardArea - offsetY + _scrollEffectDistance;
    // 基本は何もしないが、カードがアニメーション範囲に達した場合、カードを横方向に圧縮しながらOpacityを強める
    final fadeAnimationValue = min(1, max(0, distanceFromTop / _scrollEffectDistance)).toDouble();
    return fadeAnimationValue;
  }

  double cardHeightCalculate({
    required int index,
    required bool isTapThisCard,
  }) {
    return isTapThisCard ? unwrapCardArea + wrapCardArea : unwrapCardArea;
  }

  void dispose() => dispose();
}
