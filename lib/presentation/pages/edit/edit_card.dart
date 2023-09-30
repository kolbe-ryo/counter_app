import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/counter/state/edit_state.dart';
import '../../constant_value.dart';
import '../main/main_page_icon_button.dart';

class EditCard extends ConsumerStatefulWidget {
  const EditCard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditCardState();
}

class _EditCardState extends ConsumerState<EditCard> {
  static const _borderRadius = 20.0;

  @override
  Widget build(BuildContext context) {
    final counter = ref.watch(editCardStateNotifierProvider);
    return SizedBox(
      height: 300,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          // BorderRadius.onlyからこちらに変更するとリストのレンダリングが爆速化する
          borderRadius: BorderRadius.circular(_borderRadius),
          side: const BorderSide(color: Colors.white),
        ),
        color: counter.categoryInfo.color,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(_borderRadius),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_borderRadius),
            color: counter.categoryInfo.color,
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: kPadding / 2),
                        child: Text(
                          counter.name.value,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          MainPageIconButton.addCountNoAct(),
                          MainPageIconButton.minusCountNoAct(),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Text(
                      counter.description ?? 'No description',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MainPageIconButton.editNoAct(),
                      MainPageIconButton.removeNoAct(),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: kPadding / 2),
                  child: Text(
                    counter.count.count.toString(),
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
    );
  }
}
