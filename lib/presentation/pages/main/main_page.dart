import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

final _cards = List.filled(5, const _Card());

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        // TODO: Sliverでの実装を検討すること
        child: StackedCardCarousel(
          items: _cards,
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Card(
        color: Colors.white54,
        child: InkWell(
          onTap: () {
            debugPrint('Card taped');
          },
          child: const SizedBox(
            width: 300,
            height: 100,
            child: Column(
              children: [
                Text('Card05'),
                Text('please tap'),
                Text('animation'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
