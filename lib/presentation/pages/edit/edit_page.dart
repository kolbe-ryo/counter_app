import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/counter/state/edit_state.dart';
import '../../common/counter_card.dart';
import 'edit_page_header.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            EditPageHeader(),
            _EditCard(),
          ],
        ),
      ),
    );
  }
}

class _EditCard extends ConsumerWidget {
  const _EditCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(editCardStateNotifierProvider);
    return SizedBox(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: CounterCard.forEdit(
        counter: counter,
      ),
    );
  }
}
