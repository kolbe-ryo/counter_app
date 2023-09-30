import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/counter/state/edit_state.dart';
import '../../../domain/mock/mock_data.dart';
import '../../../domain/repository/counter/entity/category_info.dart';
import '../../../util/logger.dart';
import '../../constant_value.dart';

class CategorySelector extends ConsumerWidget {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCategory = ref.watch(editCardStateNotifierProvider).categoryInfo;
    final categoryList = mockData.map((e) => e.categoryInfo).toSet().toList();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Category',
            style: TextStyle(
              color: Colors.black38,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: kPadding),
          Wrap(
            spacing: kPadding / 2,
            children: [
              ...categoryList.map<Widget>((categoryInfo) {
                if (categoryInfo.name == currentCategory.name) {
                  return _CategoryElement.select(categoryInfo: categoryInfo);
                }
                return _CategoryElement.nonSelect(categoryInfo: categoryInfo);
              }),
              IconButton.outlined(
                // TODO: Add plus button action
                onPressed: () => logger.info,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CategoryElement extends ConsumerWidget {
  const _CategoryElement._(
    this._categoryInfo,
    this._buttonStyle,
    this._textStyle,
  );

  factory _CategoryElement.nonSelect({
    required CategoryInfo categoryInfo,
  }) {
    return _CategoryElement._(
      categoryInfo,
      OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        shape: const StadiumBorder(),
        side: const BorderSide(color: Colors.black45),
        splashFactory: NoSplash.splashFactory,
      ),
      const TextStyle(
        color: Colors.black26,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  factory _CategoryElement.select({
    required CategoryInfo categoryInfo,
  }) {
    return _CategoryElement._(
      categoryInfo,
      OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        shape: const StadiumBorder(),
        side: BorderSide(color: categoryInfo.color),
        splashFactory: NoSplash.splashFactory,
      ),
      TextStyle(
        color: categoryInfo.color,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  final CategoryInfo _categoryInfo;

  final ButtonStyle _buttonStyle;

  final TextStyle _textStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton(
      style: _buttonStyle,
      onPressed: () {
        ref.read(editCardStateNotifierProvider.notifier).changeCategory(_categoryInfo);
        logger.info(_categoryInfo.name);
      },
      child: Text(
        _categoryInfo.name,
        style: _textStyle,
      ),
    );
  }
}
