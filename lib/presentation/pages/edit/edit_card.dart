import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constant_value.dart';

// TODO: Edit用のカートにする
class EditCard extends ConsumerWidget {
  const EditCard(
    this._counter,
    this._onTap, {
    super.key,
  });

  final Counter _counter;

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
