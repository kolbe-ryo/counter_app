enum ContentEditorEnum {
  title(
    'Title',
    'Input Title',
  ),
  description(
    'Description',
    'Input Description',
  );

  const ContentEditorEnum(
    this.label,
    this.hintText,
  );

  final String label;
  final String hintText;

  bool get isTitle => this == ContentEditorEnum.title;

  bool get isDescription => this == ContentEditorEnum.title;
}
