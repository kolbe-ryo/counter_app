import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../util/text_styles.dart';
import '../../constant_value.dart';

class ContentsEditor extends ConsumerStatefulWidget {
  const ContentsEditor._(
    this._initialText,
    this._onChangeText,
    this._labelText,
    this._hintText,
  );

  factory ContentsEditor.title({
    required String initialText,
    required void Function(String) onChangeText,
  }) {
    return ContentsEditor._(
      initialText,
      onChangeText,
      'Title',
      'Input Title',
    );
  }

  factory ContentsEditor.description({
    required String initialText,
    required void Function(String) onChangeText,
  }) {
    return ContentsEditor._(
      initialText,
      onChangeText,
      'Description',
      'Input Description',
    );
  }

  final String _initialText;

  final void Function(String text) _onChangeText;

  final String _labelText;

  final String _hintText;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContentsEditorState();
}

class _ContentsEditorState extends ConsumerState<ContentsEditor> {
  late final TextEditingController _textEditingController;

  String? _errorText;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget._initialText);
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(kPadding, kPadding * 2, kPadding, 0),
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        controller: _textEditingController,
        decoration: InputDecoration(
          labelText: widget._labelText,
          labelStyle: const TextStyle(
            color: Colors.black38,
            fontSize: 24,
          ),
          hintText: widget._hintText,
          hintStyle: const TextStyle(
            color: Colors.black38,
            fontSize: 24,
          ),
          errorText: _errorText,
        ),
        style: TextStyles.middleFontStyle,
        onChanged: (_) {
          _validate();
          widget._onChangeText(_textEditingController.text);
        },
      ),
    );
  }
}
