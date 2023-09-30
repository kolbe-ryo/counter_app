import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/counter/state/edit_state.dart';
import '../../constant_value.dart';
import 'category_selector.dart';
import 'contents_editor.dart';
import 'edit_card.dart';
import 'edit_page_header.dart';

class EditPage extends ConsumerWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(
      editCardStateNotifierProvider.select((value) => value.name),
    );
    final description = ref.watch(
      editCardStateNotifierProvider.select((value) => value.description),
    );
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // TODO:  Adjust Sliver
          const EditPageHeader(),
          const EditCard(),
          ContentsEditor.title(
            initialText: title.value,
            onChangeText: ref.read(editCardStateNotifierProvider.notifier).changeCounterName,
          ),
          ContentsEditor.description(
            initialText: description ?? '',
            onChangeText: ref.read(editCardStateNotifierProvider.notifier).changeDescription,
          ),
          const SizedBox(height: kPadding * 2),
          const CategorySelector(),
        ],
      ),
    );
  }
}
