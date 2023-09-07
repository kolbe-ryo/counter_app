import 'dart:math';

import 'package:flutter/material.dart';

import '../../../util/logger.dart';
import '../../../util/text_styles.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _StackedCardList(),
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

  // 現在のスクロール位置からどれだけOffsetされたか
  var _offset = 0.0;

  // アニメーション（TransitionとOpacity）が発動する範囲 0~XXを定める
  static const _scrollAtLeast = 100;

  static const _unwrapCardArea = 100.0;

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
              labelColor: Colors.cyan,
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
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.black26,
              labelStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(bottom: 20),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final character = testCharacters[index];

              final position = index * _unwrapCardArea;
              final distanceTopTop = position - _offset + _scrollAtLeast;
              var translate = Offset.zero;
              if (distanceTopTop < _scrollAtLeast) {
                translate = Offset(0, -distanceTopTop + _scrollAtLeast);
              }

              final double fadeAnimationValue = min(1, max(0, distanceTopTop / _scrollAtLeast));

              return Transform.translate(
                offset: translate,
                child: Opacity(
                  opacity: fadeAnimationValue,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: (1 - fadeAnimationValue) * 60,
                        right: (1 - fadeAnimationValue) * 60,
                      ),
                      child: SizedBox(
                        height: _unwrapCardArea,
                        child: Stack(
                          fit: StackFit.passthrough,
                          children: [
                            OverflowBox(
                              minHeight: 140,
                              maxHeight: 140,
                              child: Card(
                                clipBehavior: Clip.none,
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  // BorderRadius.onlyからこちらに変更するとリストのレンダリングが爆速化する
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                color: Color(character.color!),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Text(
                                          character.title!,
                                          style: const TextStyle(fontSize: 20, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 8, right: 8),
                                      child: Text('Image'),
                                    ),
                                  ],
                                ),
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
            childCount: testCharacters.length,
          ),
        ),
      ],
    );
  }
}

final testCharacters = [
  ...characters,
  ...characters,
  ...characters,
  ...characters,
];

class Character {
  Character({
    // this.avatar,
    this.title,
    this.description,
    this.color,
  });
  // final String? avatar;
  final String? title;
  final String? description;
  final int? color;
}

//source: https://www.giantbomb.com/dragon-ball-z/3025-159/characters/
final characters = <Character>[
  Character(
    title: 'Goku',
    description:
        'Goku is the main protagonist in the Dragon Ball franchise and one of the strongest fighters in the universe. He is a Saiyan warrior whose original name was Kakarot, son of Bardock. He is the husband of Chi Chi, and the father of Gohan and Goten. He is also Grandfather to Pan.',
    // avatar: 'assets/goku.png',
    color: 0xFFE83835,
  ),
  Character(
    title: 'Vegeta',
    description:
        'The Prince of all Saiyans, Vegeta is an incredibly strong elite Saiyan warrior. In his constant struggle to surpass his eternal rival Goku, he has become one of the most powerful fighters in the universe.',
    // avatar: 'assets/vegeta.png',
    color: 0xFF238BD0,
  ),
  Character(
    title: 'Gohan',
    description:
        "Gohan is Goku's son and one of the heroes in the Dragon Ball Z universe. He is also the protagonist of the Cell Saga, where he is the first to reach the Super Saiyan 2 form, through immense anger and emotion. In his later Ultimate form, he is considered the most powerful warrior in Dragon Ball Z. He is Goten's older brother and the father of Pan. His wife is Videl and his grandfathers are Ox-king and Bardock, respectively.",
    // avatar: 'assets/gohan.png',
    color: 0xFF354C6C,
  ),
  Character(
    title: 'Frieza',
    description: 'In the Dragon Ball Z universe, Frieza is one of the first villains to really test Goku.',
    // avatar: 'assets/frieza.png',
    color: 0xFF6F2B62,
  ),
  Character(
    title: 'Cell',
    description:
        'Cell is an android constructed from cells taken from various fighters of the Dragon Ball Z universe. He is the main antagonist of the Android Saga of Dragon Ball.',
    // avatar: 'assets/cell.png',
    color: 0xFF447C12,
  ),
  Character(
    title: 'Majin Buu',
    description:
        "One of Dragon Ball Z's most ferocious and transformation-happy of characters, Majin Buu is the last major enemy in the Dragon Ball Z storyline. With the ability to absorb foes, learn moves, and deliver a serious punch, Majin Buu is one of Goku and friends' most challenging of enemies.",
    // avatar: 'assets/boo.png',
    color: 0xFFE7668E,
  ),
  Character(
    title: 'Broly',
    description:
        "The Legendary Super Saiyan from myth, Broly is one of the Dragon Ball Z franchise's most powerful and destructive Saiyan villains.",
    // avatar: 'assets/broly.png',
    color: 0xFFBD9158,
  ),
];
