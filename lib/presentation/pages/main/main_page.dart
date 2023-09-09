import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/mock/mock_data.dart';
import '../../../util/logger.dart';
import '../../../util/text_styles.dart';
import '../../constant_value.dart';
import 'strategy/header_icon_interface.dart';

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
  /// アニメーション（TransitionとOpacity）が発動する範囲 0~XXを定める
  static const _scrollEffectDistance = 100;

  /// カードの実エリア
  static const _unwrapCardArea = 100.0;

  /// カードの下方向へのオーバーフローエリア
  static const _wrapCardArea = 100.0;

  /// フェード時のカードの左右割合
  static const _cardReductionRate = 60;

  late final ScrollController _scrollController;

  var _offset = 0.0;

  bool isTapCard = false;

  int _activateCardIndex = 0;

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
  void _listener() => setState(() => _offset = _scrollController.position.pixels);

  // カードタップ時のlistener
  void _tapCard(int index) => setState(() {
        isTapCard = !isTapCard;
        _activateCardIndex = index;
      });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        const _Header(),
        const SliverPadding(
          padding: EdgeInsets.only(bottom: 10),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: testCharacters.length,
            (context, index) {
              // （タブバーからの距離）=（カードのホームポジション）-(スクロール距離）+（アニメーション範囲）
              final distanceFromTop = index * _unwrapCardArea - _offset + _scrollEffectDistance;

              var fadeOutTranslation = Offset.zero;
              var cardTapTranslation = Offset.zero;
              var tapDetection = true;

              // カードがアニメーション範囲に到達したら、上にスクロールしないようにカードを下方向に少しずつOffset
              if (distanceFromTop < _scrollEffectDistance) {
                fadeOutTranslation = Offset(0, _scrollEffectDistance - distanceFromTop);
                tapDetection = false;
              } else {
                tapDetection = true;
              }

              // 基本は何もしないが、カードがアニメーション範囲に達した場合、カードを横方向に圧縮しながらOpacityを強める
              final fadeAnimationValue = min(1, max(0, distanceFromTop / _scrollEffectDistance)).toDouble();

              if (isTapCard && index > _activateCardIndex) {
                cardTapTranslation = const Offset(0, 0.2);
              }

              final activeCard = isTapCard && index == _activateCardIndex;

              return AnimatedSlide(
                offset: cardTapTranslation,
                duration: const Duration(milliseconds: 300),
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
                          height: (isTapCard && index == _activateCardIndex)
                              ? _unwrapCardArea + _wrapCardArea
                              : _unwrapCardArea,
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
            },
          ),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
          _HeaderIcon.add(onTap: AddIconAction()),
          _HeaderIcon.menu(onTap: MenuIconAction()),
          const SizedBox(width: kPadding),
        ],
      ),
    );
  }
}

class _HeaderIcon extends ConsumerWidget {
  const _HeaderIcon._(
    this._headerIconInterface,
    this._iconData,
  );

  factory _HeaderIcon.add({required HeaderIconInterface onTap}) {
    return _HeaderIcon._(
      onTap,
      Icons.add_circle,
    );
  }

  factory _HeaderIcon.menu({required HeaderIconInterface onTap}) {
    return _HeaderIcon._(
      onTap,
      Icons.menu,
    );
  }

  final HeaderIconInterface _headerIconInterface;

  final IconData _iconData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () => _headerIconInterface.onTap(ref),
      icon: Icon(
        _iconData,
        size: 40,
        color: Colors.black,
      ),
    );
  }
}
