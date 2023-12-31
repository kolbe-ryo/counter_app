import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/counter/edit_counter_service.dart';
import '../../../application/counter/state/edit_state.dart';
import '../../../domain/mock/mock_data.dart';
import '../../../domain/repository/counter/entity/category_info.dart';
import '../../../util/logger.dart';
import '../../constant_value.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Category',
              style: TextStyle(
                color: Colors.black38,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: kPadding),
            _CategoryElements(),
            SizedBox(height: kPadding),
            _CategoryColors(),
            SizedBox(height: kPadding * 3),
          ],
        ),
      ),
    );
  }
}

class _CategoryElements extends ConsumerWidget {
  const _CategoryElements();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCategory = ref.watch(editCardStateNotifierProvider).categoryInfo;
    final categoryList = mockData.map((e) => e.categoryInfo).toSet().toList();
    return Wrap(
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
        backgroundColor: categoryInfo.color,
        foregroundColor: Colors.black,
        shape: const StadiumBorder(),
        splashFactory: NoSplash.splashFactory,
      ),
      const TextStyle(
        color: Colors.white,
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
        ref.read(editCounterServiceProvider).changeCategory(categoryInfo: _categoryInfo);
        logger.info(_categoryInfo.name);
      },
      child: Text(
        _categoryInfo.name,
        style: _textStyle,
      ),
    );
  }
}

class _CategoryColors extends ConsumerWidget {
  const _CategoryColors();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCategory = ref.watch(editCardStateNotifierProvider).categoryInfo;
    return Wrap(
      spacing: kPadding,
      runSpacing: kPadding,
      children: appColors.map((color) {
        final isSameColor = currentCategory.color == color;
        return InkWell(
          onTap: () {
            final changedCategory = currentCategory.copyWith(color: color);
            ref.read(editCounterServiceProvider).changeCategory(categoryInfo: changedCategory);
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              border: isSameColor ? Border.all(width: 3) : null,
            ),
            height: 30,
            width: 30,
          ),
        );
      }).toList(),
    );
  }
}
