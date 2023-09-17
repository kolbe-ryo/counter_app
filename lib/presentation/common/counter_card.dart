import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/mock/mock_data.dart';
import '../../domain/repository/counter/entity/counter.dart';
import '../constant_value.dart';
import '../pages/main/main_page_icon_button.dart';

class CounterCard extends ConsumerWidget {
  const CounterCard._(
    this._counter,
    this._onTap,
    this._addButton,
    this._minusButton,
    this._editButton,
    this._removeButton,
  );

  factory CounterCard.forMain({
    required int index,
    required void Function()? onTap,
  }) {
    return CounterCard._(
      mockData[index],
      onTap,
      MainPageIconButton.addCount(),
      MainPageIconButton.minusCount(),
      MainPageIconButton.edit(),
      MainPageIconButton.remove(),
    );
  }

  factory CounterCard.forEdit({
    required Counter counter,
  }) {
    return CounterCard._(
      counter,
      null,
      const SizedBox.shrink(),
      const SizedBox.shrink(),
      const SizedBox.shrink(),
      const SizedBox.shrink(),
    );
  }

  final Counter _counter;

  final void Function()? _onTap;

  final Widget _addButton;
  final Widget _minusButton;
  final Widget _editButton;
  final Widget _removeButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        // BorderRadius.onlyからこちらに変更するとリストのレンダリングが爆速化する
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Colors.white),
      ),
      color: _counter.categoryInfo.color,
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
                          _counter.name.value,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          _addButton,
                          _minusButton,
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Text(
                      _counter.description ?? 'No description',
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
                      _editButton,
                      _removeButton,
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: kPadding / 2),
                  child: Text(
                    _counter.count.count.toString(),
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
