import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/counter/state/edit_state.dart';
import '../../../util/text_styles.dart';
import '../../constant_value.dart';
import 'editor_enum.dart';

class ContentsEditor extends ConsumerStatefulWidget {
  const ContentsEditor._(this._contentEditorEnum);

  factory ContentsEditor.title() => const ContentsEditor._(ContentEditorEnum.title);

  factory ContentsEditor.description() => const ContentsEditor._(ContentEditorEnum.description);

  final ContentEditorEnum _contentEditorEnum;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContentsEditorState();
}

class _ContentsEditorState extends ConsumerState<ContentsEditor> {
  late final TextEditingController _textEditingController;

  String? _errorText;

  @override
  void initState() {
    super.initState();
    _textEditingController = _getTextEditController;
  }

  TextEditingController get _getTextEditController {
    switch (widget._contentEditorEnum) {
      case ContentEditorEnum.title:
        return TextEditingController(
          text: ref.read(editCardStateNotifierProvider).name.value,
        );
      case ContentEditorEnum.description:
        return TextEditingController(
          text: ref.read(editCardStateNotifierProvider).description,
        );
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  // バリデーションチェック関数
  void _validate() {
    setState(() => _errorText = _validateText(_textEditingController.text));
  }

  String? _validateText(String text) {
    if (text.isEmpty) {
      return 'Form is empty..';
    }
    return null;
  }

  void _onChange() {
    switch (widget._contentEditorEnum) {
      case ContentEditorEnum.title:
        ref.read(editCardStateNotifierProvider.notifier).changeCounterName(_textEditingController.text);
        break;
      case ContentEditorEnum.description:
        ref.read(editCardStateNotifierProvider.notifier).changeDescription(_textEditingController.text);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.fromLTRB(kPadding, kPadding * 2, kPadding, 0),
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          controller: _textEditingController,
          decoration: InputDecoration(
            labelText: widget._contentEditorEnum.name,
            labelStyle: const TextStyle(
              color: Colors.black38,
              fontSize: 24,
            ),
            hintText: widget._contentEditorEnum.hintText,
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
