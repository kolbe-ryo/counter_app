import 'dart:math';

import 'package:flutter/material.dart';

class SliverListDelegateService {
  SliverListDelegateService({
    required double unwrapCardArea,
    required double wrapCardArea,
  })  : _unwrapCardArea = unwrapCardArea,
        _wrapCardArea = wrapCardArea;

  final double _unwrapCardArea;
  final double _wrapCardArea;

  bool _tapDetection = true;

  /// アニメーション（TransitionとOpacity）が発動する範囲 0~XXを定める
  static const _scrollEffectDistance = 100;

  /// カードタップ時の他のカードのOffset
  static const _onTapOffset = Offset(0, 0.5);

  bool get tapDetection => _tapDetection;

  // カードが最上部付近までスクロールされた時点で下方向にOffsetするアニメーション計算ロジック
  Offset fadeOutTranslation({
    required int index,
    required double offsetY,
  }) {
    // カードの固有変数
    var fadeOutTranslation = Offset.zero;
    // （タブバーからの距離）=（カードのホームポジション）-(スクロール距離）+（アニメーション範囲）
    final distanceFromTop = index * _unwrapCardArea - offsetY + _scrollEffectDistance;

    // カードがアニメーション範囲に到達したら、上にスクロールしないようにカードを下方向に少しずつOffset
    if (distanceFromTop < _scrollEffectDistance) {
      fadeOutTranslation = Offset(0, _scrollEffectDistance - distanceFromTop);
      _tapDetection = false;
    } else {
      _tapDetection = true;
    }
    return fadeOutTranslation;
  }

  // カードがタップされた時、そのカードより下にあるカードをOffsetしてずらすアニメーション計算ロジック
  Offset cardTapTransition({
    required int index,
    required bool isTapCard,
    required int activeCardIndex,
  }) {
    // カードの固有変数
    var cardTapTranslation = Offset.zero;

    if (isTapCard && index > activeCardIndex) {
      cardTapTranslation = _onTapOffset;
    }
    return cardTapTranslation;
  }

  // カードが最上部付近までスクロールされた時点で横幅が圧縮され、Opacityで消えていくアニメーション計算ロジック
  double fadeAnimationValue({
    required int index,
    required double offsetY,
  }) {
    // （タブバーからの距離）=（カードのホームポジション）-(スクロール距離）+（アニメーション範囲）
    final distanceFromTop = index * _unwrapCardArea - offsetY + _scrollEffectDistance;
    // 基本は何もしないが、カードがアニメーション範囲に達した場合、カードを横方向に圧縮しながらOpacityを強める
    final fadeAnimationValue = min(1, max(0, distanceFromTop / _scrollEffectDistance)).toDouble();
    return fadeAnimationValue;
  }

  double cardHeightCalculate({
    required int index,
    required bool isTapThisCard,
  }) {
    return isTapThisCard ? _unwrapCardArea + _wrapCardArea : _unwrapCardArea;
  }

  void dispose() => dispose();
}
