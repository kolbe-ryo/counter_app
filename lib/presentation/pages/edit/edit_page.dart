import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/counter/state/edit_state.dart';
import '../../../util/text_styles.dart';
import '../../common/counter_card.dart';
import '../../constant_value.dart';
import 'edit_page_header.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          behavior: HitTestBehavior.opaque,
          child: const SingleChildScrollView(
            child: Column(
              children: [
                EditPageHeader(),
                _EditCard(),
                _ContentsEditor(),
              ],
            ),
          ),
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

class _ContentsEditor extends ConsumerStatefulWidget {
  const _ContentsEditor();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __ContentsEditorState();
}

class __ContentsEditorState extends ConsumerState<_ContentsEditor> {
  late final TextEditingController _titleTextController;
  late final TextEditingController _descriptionTextController;

  String? _titleErrorText;
  String? _descriptionErrorText;

  @override
  void initState() {
    super.initState();
    final initialTitleText = ref.read(editCardStateNotifierProvider).name.value;
    final initialDescriptionText = ref.read(editCardStateNotifierProvider).description;
    _titleTextController = TextEditingController(text: initialTitleText);
    _descriptionTextController = TextEditingController(text: initialDescriptionText);
  }

  @override
  void dispose() {
    _titleTextController.dispose();
    _descriptionTextController.dispose();
    super.dispose();
  }

  // バリデーションチェック関数
  void _validate() {
    setState(() {
      _titleErrorText = _validateText(_titleTextController.text);
      _descriptionErrorText = _validateText(_descriptionTextController.text);
    });
  }

  String? _validateText(String text) {
    if (text.isEmpty) {
      return 'Form is empty..';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TextFormField(
          textController: _titleTextController,
          validation: (_) => _validate(),
          errorText: _titleErrorText,
          labelText: 'Title',
          hintText: 'Input Title',
          textStyle: TextStyles.largeFontStyle,
        ),
        _TextFormField(
          textController: _descriptionTextController,
          validation: (_) => _validate(),
          errorText: _descriptionErrorText,
          labelText: 'Description',
          hintText: 'Input Description',
          textStyle: TextStyles.middleFontStyle,
        ),
      ],
    );
  }
}

class _TextFormField extends ConsumerStatefulWidget {
  const _TextFormField({
    required TextEditingController textController,
    required void Function(String?) validation,
    required String? errorText,
    required String labelText,
    required String hintText,
    required TextStyle textStyle,
  })  : _textController = textController,
        _validation = validation,
        _errorText = errorText,
        _labelText = labelText,
        _hintText = hintText,
        _textStyle = textStyle;

  final TextEditingController _textController;

  final void Function(String?) _validation;

  final String? _errorText;

  final String _labelText;

  final String _hintText;

  final TextStyle _textStyle;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __TextFormFieldState();
}

class __TextFormFieldState extends ConsumerState<_TextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      margin: const EdgeInsets.only(top: kPadding * 2),
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        controller: widget._textController,
        decoration: InputDecoration(
          labelText: widget._labelText,
          labelStyle: const TextStyle(color: Colors.black26),
          hintText: widget._hintText,
          hintStyle: const TextStyle(color: Colors.black26),
          errorText: widget._errorText,
        ),
        style: widget._textStyle,
        onChanged: widget._validation,
      ),
    );
  }
}
