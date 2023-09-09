import 'dart:math';

import 'package:flutter/material.dart';

import '../../../domain/mock/mock_data.dart';
import '../../../util/logger.dart';
import '../../../util/text_styles.dart';
import '../../constant_value.dart';

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
  late final ScrollController _scrollController;

  bool isTapCard = false;

  int cardIndex = 0;

  /// 現在のスクロール位置からどれだけOffsetされたか
  var _offset = 0.0;

  /// アニメーション（TransitionとOpacity）が発動する範囲 0~XXを定める
  static const _scrollEffectDistance = 100;

  /// カードの実エリア
  static const _unwrapCardArea = 100.0;

  /// カードの下方向へのオーバーフローエリア
  static const _wrapCardArea = 100.0;

  /// フェード時のカードの左右割合
  static const _cardReductionRate = 60;

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

  // Listener for scroll controller
  void _listener() => setState(() => _offset = _scrollController.position.pixels);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        DefaultTabController(
          length: 7,
          child: SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            elevation: 0,
            title: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'COUNTERS',
                style: TextStyles.largeFontStyle,
              ),
            ),
            bottom: TabBar(
              isScrollable: true,
              labelColor: Colors.pinkAccent,
              onTap: logger.info,
              tabs: const [
                Tab(text: 'ALL'),
                Tab(text: 'BREAD'),
                Tab(text: 'EGG'),
                Tab(text: 'SPONGE'),
                Tab(text: 'NOTE'),
                Tab(text: 'BEER'),
                Tab(text: 'COKE'),
              ],
              indicatorColor: Colors.transparent,
              unselectedLabelColor: Colors.grey,
              labelStyle: TextStyles.middleFontStyle,
            ),
            actions: [
              IconButton(
                onPressed: () => logger.info('Add'),
                icon: const Icon(
                  Icons.add_circle,
                  size: 40,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () => logger.info('Menu'),
                icon: const Icon(
                  Icons.menu,
                  size: 40,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: kPadding),
            ],
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(bottom: 10),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              // それぞれのカートのホームポジション
              final position = index * _unwrapCardArea;

              // 最上部（タブバー）からの距離に
              final distanceFromTop = position - _offset + _scrollEffectDistance;
              var translate = Offset.zero;
              var translate2 = Offset.zero;

              var isNotTap = false;

              // カードが_scrollEffectDistanceより最上部（タブバー）に近くなったら、上にスクロールしないように下方向にOffset
              if (distanceFromTop < _scrollEffectDistance) {
                translate = Offset(0, -distanceFromTop + _scrollEffectDistance);
                isNotTap = true;
              } else {
                isNotTap = false;
              }

              final double fadeAnimationValue = min(1, max(0, distanceFromTop / _scrollEffectDistance));

              if (isTapCard && index > cardIndex) {
                translate2 = const Offset(0, 0.2);
              }

              return AnimatedSlide(
                offset: translate2,
                duration: const Duration(milliseconds: 300),
                child: Transform.translate(
                  offset: translate,
                  child: Opacity(
                    opacity: fadeAnimationValue,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: (1 - fadeAnimationValue) * _cardReductionRate,
                        ),
                        child: SizedBox(
                          height: (isTapCard && index == cardIndex) ? _unwrapCardArea + _wrapCardArea : _unwrapCardArea,
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
                                      if (isNotTap) {
                                        return;
                                      }
                                      setState(() {
                                        isTapCard = !isTapCard;
                                        cardIndex = index;
                                      });
                                    },
                                    borderRadius: BorderRadius.circular(20),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Padding(
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
            },
            childCount: testCharacters.length,
          ),
        ),
      ],
    );
  }
}
