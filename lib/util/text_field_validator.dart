class TextEditValidator {
  static String? validateText(String text) {
    if (text.isEmpty) {
      return 'Form is empty..';
    }
    return null;
  }
}
