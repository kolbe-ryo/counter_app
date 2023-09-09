import 'package:flutter/material.dart';

import '../../../domain/mock/mock_data.dart';
import 'main_page_header.dart';
import 'strategy/sliver_list_delegate_service.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const Scaffold(
        body: _StackedCardList(),
      ),
    );
  }
}

class _StackedCardList extends StatefulWidget {
  const _StackedCardList();

  @override
  _StackedCardListState createState() => _StackedCardListState();
}

class _StackedCardListState extends State<_StackedCardList> {
  /// カードの実エリア
  static const _unwrapCardArea = 100.0;

  /// カードの下方向へのオーバーフローエリア
  static const _wrapCardArea = 100.0;

  /// フェード時のカードの左右割合
  static const _cardReductionRate = 60;

  late final ScrollController _scrollController;

  var _offsetY = 0.0;

  var _activateCardIndex = 0;

  bool _isTapCard = false;

  late final SliverListDelegateService _sliverListDelegateService;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_listener);
    _sliverListDelegateService = SliverListDelegateService(
      unwrapCardArea: _unwrapCardArea,
      wrapCardArea: _wrapCardArea,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _sliverListDelegateService.dispose();
    super.dispose();
  }

  // スクロールした分を検知し、現在のスクロール位置からどれだけ動かしたか
  void _listener() => setState(() => _offsetY = _scrollController.position.pixels);

  // カードタップ時のlistener
  void _tapCard(int index) => setState(() {
        _isTapCard = !_isTapCard;
        _activateCardIndex = index;
      });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        const MainPageHeader(),
        const SliverPadding(padding: EdgeInsets.only(bottom: 10)),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: testCharacters.length,
            (context, index) {
              final fadeOutTranslation = _sliverListDelegateService.fadeOutTranslation(
                index: index,
                offsetY: _offsetY,
              );

              final cardTapTranslation = _sliverListDelegateService.cardTapTransition(
                index: index,
                isTapCard: _isTapCard,
                activeCardIndex: _activateCardIndex,
              );

              final fadeAnimationValue = _sliverListDelegateService.fadeAnimationValue(
                index: index,
                offsetY: _offsetY,
              );

              final tapDetection = _sliverListDelegateService.tapDetection;

              final cardHeight = _sliverListDelegateService.cardHeightCalculate(
                index: index,
                isTapCard: _isTapCard,
                activeCardIndex: _activateCardIndex,
              );

              // // （タブバーからの距離）=（カードのホームポジション）-(スクロール距離）+（アニメーション範囲）
              // final distanceFromTop = index * _unwrapCardArea - _offsetY + _scrollEffectDistance;

              // // 基本は何もしないが、カードがアニメーション範囲に達した場合、カードを横方向に圧縮しながらOpacityを強める
              // final fadeAnimationValue = min(1, max(0, distanceFromTop / _scrollEffectDistance)).toDouble();

              // // カードの固有変数
              // var fadeOutTranslation = Offset.zero;
              // var cardTapTranslation = Offset.zero;
              // var tapDetection = true;

              // // カードがアニメーション範囲に到達したら、上にスクロールしないようにカードを下方向に少しずつOffset
              // if (distanceFromTop < _scrollEffectDistance) {
              //   fadeOutTranslation = Offset(0, _scrollEffectDistance - distanceFromTop);
              //   tapDetection = false;
              // } else {
              //   tapDetection = true;
              // }

              // if (_isTapCard && index > _activateCardIndex) {
              //   cardTapTranslation = _onTapOffset;
              // }

              // final activeCard = _isTapCard && index == _activateCardIndex;

              return AnimatedSlide(
                offset: cardTapTranslation,
                curve: Curves.ease,
                duration: const Duration(milliseconds: 500),
                child: Transform.translate(
                  offset: fadeOutTranslation,
                  child: Opacity(
                    opacity: fadeAnimationValue,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: (1 - fadeAnimationValue) * _cardReductionRate,
                        ),
                        child: SizedBox(
                          // TODO: ここをタップ時に増加させているせいでアニメーションが少し変になっている問題の解消
                          height: cardHeight,
                          width: double.infinity,
                          child: Stack(
                            fit: StackFit.passthrough,
                            children: [
                              OverflowBox(
                                alignment: Alignment.topCenter,
                                minHeight: _unwrapCardArea + _wrapCardArea,
                                maxHeight: _unwrapCardArea + _wrapCardArea,
                                child: Card(
                                  clipBehavior: Clip.none,
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    // BorderRadius.onlyからこちらに変更するとリストのレンダリングが爆速化する
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  color: Color(testCharacters[index].color!),
                                  child: InkWell(
                                    onTap: () {
                                      if (tapDetection) {
                                        _tapCard(index);
                                      }
                                    },
                                    borderRadius: BorderRadius.circular(20),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Text(
                                            testCharacters[index].title!,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
              return null;
            },
          ),
        ),
      ],
    );
  }
}
