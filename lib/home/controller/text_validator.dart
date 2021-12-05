class TextValidator {
  static String? checkIfEmpty(String text) {
    return text.length > 2 ? null : 'Length should be greater than 2';
  }
}
