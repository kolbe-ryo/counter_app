import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/counter/edit_counter_service.dart';
import '../../../application/counter/state/edit_state.dart';
import '../../../util/text_field_validator.dart';
import '../../../util/text_styles.dart';
import '../../constant_value.dart';

class ContentsEditorForTitle extends ConsumerStatefulWidget {
  const ContentsEditorForTitle({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContentsEditorForTitleState();
}

class _ContentsEditorForTitleState extends ConsumerState<ContentsEditorForTitle> {
  late final TextEditingController _textEditingController;

  String? _errorText;

  @override
  void initState() {
    super.initState();
    final initText = ref.read(editCardStateNotifierProvider).name.value;
    _textEditingController = TextEditingController(text: initText);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  // バリデーションチェック関数
  void _validate() {
    setState(() => _errorText = TextEditValidator.validateText(_textEditingController.text));
  }

  void _onChange() => ref.read(editCounterServiceProvider).changeCounterName(name: _textEditingController.text);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.fromLTRB(kPadding, kPadding * 2, kPadding, 0),
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          controller: _textEditingController,
          decoration: InputDecoration(
            labelText: 'Title',
            labelStyle: const TextStyle(
              color: Colors.black38,
              fontSize: 24,
            ),
            hintText: 'Input title',
            hintStyle: const TextStyle(
              color: Colors.black38,
              fontSize: 24,
            ),
            errorText: _errorText,
          ),
          style: TextStyles.middleFontStyle,
          onChanged: (_) {
            _validate();
            _onChange();
          },
        ),
      ),
    );
  }
}

class ContentsEditorForDescription extends ConsumerStatefulWidget {
  const ContentsEditorForDescription({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContentsEditorForDescriptionState();
}

class _ContentsEditorForDescriptionState extends ConsumerState<ContentsEditorForDescription> {
  late final TextEditingController _textEditingController;

  String? _errorText;

  @override
  void initState() {
    super.initState();
    final initText = ref.read(editCardStateNotifierProvider).description;
    _textEditingController = TextEditingController(text: initText);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  // バリデーションチェック関数
  void _validate() {
    setState(() => _errorText = TextEditValidator.validateText(_textEditingController.text));
  }

  void _onChange() => ref.read(editCounterServiceProvider).changeDescription(description: _textEditingController.text);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.fromLTRB(kPadding, kPadding * 2, kPadding, 0),
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          controller: _textEditingController,
          decoration: InputDecoration(
            labelText: 'Description',
            labelStyle: const TextStyle(
              color: Colors.black38,
              fontSize: 24,
            ),
            hintText: 'Input description',
            hintStyle: const TextStyle(
              color: Colors.black38,
              fontSize: 24,
            ),
            errorText: _errorText,
          ),
          style: TextStyles.middleFontStyle,
          onChanged: (_) {
            _validate();
            _onChange();
          },
        ),
      ),
    );
  }
}
