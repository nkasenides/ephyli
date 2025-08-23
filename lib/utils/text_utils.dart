import 'dart:math';

extension TextUtils on String {

  capitalizeFirstLetter() {
    return substring(0, 1).toUpperCase() + substring(1, length);
  }

  bool get isValidEmailAddress =>
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);

  bool get containsUppercase => contains(RegExp(r'[A-Z]'));

  bool get containsLowercase => contains(RegExp(r'[a-z]'));

  bool get containsNumber => contains(RegExp(r'[0-9]'));

  bool get isValidPersonName => RegExp(r"^[\p{L} ,.'-]*$", caseSensitive: false, unicode: true, dotAll: true).hasMatch(this);

  static String getRandomString(int length, {bool upTo = false}) {
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    int lengthReal = length;
    if (upTo) {
      lengthReal = _rnd.nextInt(length);
    }
    return String.fromCharCodes(Iterable.generate(
        lengthReal, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  /// Removes Greek accents from a string.
  static removeGreekAccents(String text) {
    text = text.replaceAll("Έ", "Ε");
    text = text.replaceAll("Ή", "Η");
    text = text.replaceAll("Ί", "Ι");
    text = text.replaceAll("Ό", "Ο");
    text = text.replaceAll("Ύ", "Υ");
    text = text.replaceAll("Ώ", "Ω");
    return text;
  }

}