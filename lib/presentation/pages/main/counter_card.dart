import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/mock/mock_data.dart';
import '../../constant_value.dart';
import 'main_page_icon_button.dart';

class CounterCard extends ConsumerWidget {
  const CounterCard({
    required int index,
    required void Function() onTap,
    super.key,
  })  : _index = index,
        _onTap = onTap;

  final int _index;

  final void Function()? _onTap;

  static const _borderRadius = 20.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = mockData[_index];
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        // BorderRadius.onlyからこちらに変更するとリストのレンダリングが爆速化する
        borderRadius: BorderRadius.circular(_borderRadius),
        side: const BorderSide(color: Colors.white),
      ),
      color: counter.categoryInfo.color,
      child: InkWell(
        borderRadius: BorderRadius.circular(_borderRadius),
        onTap: _onTap,
        child: Padding(
          padding: const EdgeInsets.all(_borderRadius),
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
                          MainPageIconButton.addCount(),
                          MainPageIconButton.minusCount(),
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
                      MainPageIconButton.edit(),
                      MainPageIconButton.remove(),
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
