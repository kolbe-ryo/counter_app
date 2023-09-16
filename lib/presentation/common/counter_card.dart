import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/mock/mock_data.dart';
import '../constant_value.dart';
import '../pages/main/main_page_icon_button.dart';

class CounterCard extends ConsumerWidget {
  const CounterCard({
    required int index,
    required void Function()? onTap,
    super.key,
  })  : _index = index,
        _onTap = onTap;

  final int _index;
  final void Function()? _onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        // BorderRadius.onlyからこちらに変更するとリストのレンダリングが爆速化する
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Colors.white),
      ),
      color: mockData[_index].categoryInfo.color,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: _onTap,
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
                      Padding(
                        padding: const EdgeInsets.only(top: kPadding / 2),
                        child: Text(
                          mockData[_index].name.value,
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
                    mockData[_index].count.count.toString(),
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
