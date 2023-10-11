import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/counter/edit_counter_service.dart';
import '../../../domain/mock/mock_data.dart';
import 'counter_card.dart';
import 'main_page_header.dart';
import 'strategy/sliver_list_delegate_service.dart';

/// カードの実エリア
const unwrapCardArea = 80.0;

/// カードの下方向へのオーバーフローエリア
const wrapCardArea = 200.0;

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

class _StackedCardList extends ConsumerStatefulWidget {
  const _StackedCardList();

  @override
  _StackedCardListState createState() => _StackedCardListState();
}

class _StackedCardListState extends ConsumerState<_StackedCardList> {
  /// フェード時のカードの左右割合
  static const _cardReductionRate = 60;

  late final ScrollController _scrollController;

  var _offsetY = 0.0;

  var _activateCardIndex = 0;

  bool _isTapCard = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_listener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // スクロールした分を検知し、現在のスクロール位置からどれだけ動かしたか
  // また、スクロールを検知した時点でカードフォーカスを外す
  void _listener() => setState(() {
        _offsetY = _scrollController.position.pixels;
        _isTapCard = false;
      });

  // カードタップ状態の変更と現在タップしたカードのインデックス更新
  Future<void> _tapCard(int index) async {
    ref.read(editCounterServiceProvider).updateState(counter: mockData[index]);
    setState(() {
      _isTapCard = !_isTapCard;
      _activateCardIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sliverListDelegateService = ref.watch(sliverListDelegateServiceProvider);
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        const MainPageHeader(),
        const SliverPadding(padding: EdgeInsets.only(bottom: 10)),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: mockData.length,
            (context, index) {
              final isTapThisCard = _isTapCard && index == _activateCardIndex;

              final fadeOutTranslation = sliverListDelegateService.fadeOutTranslation(
                index: index,
                offsetY: _offsetY,
              );

              final fadeAnimationValue = sliverListDelegateService.fadeAnimationValue(
                index: index,
                offsetY: _offsetY,
              );

              final tapDetection = sliverListDelegateService.tapDetection;

              final cardHeight = sliverListDelegateService.cardHeightCalculate(
                index: index,
                isTapThisCard: isTapThisCard,
              );

              final isLastCard = index == mockData.length - 1;

              // TODO: 長押しでカードの場所を変更できるようにする
              return Transform.translate(
                offset: fadeOutTranslation,
                child: Opacity(
                  opacity: fadeAnimationValue,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: (1 - fadeAnimationValue) * _cardReductionRate,
                    ),
                    child: AnimatedSize(
                      alignment: Alignment.topCenter,
                      curve: Curves.ease,
                      duration: const Duration(milliseconds: 300),
                      child: SizedBox(
                        height: isLastCard ? unwrapCardArea + wrapCardArea + 100 : cardHeight,
                        width: double.infinity,
                        child: Stack(
                          fit: StackFit.passthrough,
                          children: [
                            OverflowBox(
                              alignment: Alignment.topCenter,
                              minHeight: unwrapCardArea + wrapCardArea,
                              maxHeight: unwrapCardArea + wrapCardArea,
                              child: CounterCard(
                                index: index,
                                onTap: () async {
                                  if (tapDetection || _isTapCard) {
                                    await _tapCard(index);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
