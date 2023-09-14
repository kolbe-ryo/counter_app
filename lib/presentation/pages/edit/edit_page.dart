import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../util/logger.dart';
import '../../constant_value.dart';
import '../../router.dart';
import '../main/main_page_icon_button.dart';

class EditPage extends ConsumerWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const _EditCard(),
            Center(
              child: TextButton(
                onPressed: () => ref.watch(routerProvider).go(MainPageRoute.name),
                child: const Text('Edit Page'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EditCard extends ConsumerWidget {
  const _EditCard();

  Widget _child(BuildContext context) => SizedBox(
        height: 300,
        width: MediaQuery.of(context).size.width,
        child: Card(
          clipBehavior: Clip.none,
          elevation: 1,
          shape: RoundedRectangleBorder(
            // BorderRadius.onlyからこちらに変更するとリストのレンダリングが爆速化する
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.amber,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: kPadding / 2),
                            child: Text(
                              'test',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              MainPageIconButton.addCount(),
                              MainPageIconButton.minusCount(),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MainPageIconButton.edit(),
                          MainPageIconButton.remove(),
                        ],
                      ),
                    ],
                  ),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: kPadding / 2),
                      child: Text(
                        '10',
                        style: TextStyle(
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
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final limitedSlidable = MediaQuery.of(context).size.height / 3;
    return Draggable(
      axis: Axis.vertical,
      // ドラッグ終了と同時にOffset量に応じて画面を閉じたり何もしなかったりする
      onDragEnd: (detail) {
        logger.info('onEnd');
        if (limitedSlidable > detail.offset.dy && detail.offset.dy > 0) {
          return;
        }
        ref.watch(routerProvider).go(MainPageRoute.name);
      },
      feedback: _child(context),
      childWhenDragging: const SizedBox.shrink(),
      child: _child(context),
    );
  }
}
