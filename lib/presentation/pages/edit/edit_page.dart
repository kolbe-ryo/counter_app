import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constant_value.dart';
import 'category_selector.dart';
import 'contents_editor.dart';
import 'edit_card.dart';
import 'edit_page_header.dart';

class EditPage extends ConsumerWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          // TODO:  Adjust Sliver
          EditPageHeader(),
          EditCard(),
          // ContentsEditor.title(),
          // ContentsEditor.description(),
          AppTextField(),
          SliverPadding(
            padding: EdgeInsets.only(top: kPadding * 2),
          ),
          CategorySelector(),
        ],
      ),
    );
  }
}
