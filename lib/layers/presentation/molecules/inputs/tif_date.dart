import 'package:flutter/services.dart';

/// https://stackoverflow.com/a/77226246
class TIFDate extends TextInputFormatter {
  static const _maxChars = 8;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (!isValidDate(newValue.text)) {
      return oldValue;
    }
    var text = _format(newValue.text, '/');
    return newValue.copyWith(text: text, selection: updateCursorPosition(text));
  }

  String _format(String value, String separator) {
    value = value.replaceAll(separator, '');
    var newString = '';

    for (int i = 0; i < min(value.length, _maxChars); i++) {
      newString += value[i];
      if ((i == 1 || i == 3) && i != value.length - 1) {
        newString += separator;
      }
    }

    return newString;
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }

  bool isValidDate(String value) {
    if (value.length == 1) {
      return ['0', '1'].contains(value);
    } else if (value.length == 2) {
      var number = int.parse(value);
      return number >= 1 && number <= 12;
    } else {
      return true;
    }
  }

  int min(int a, int b) {
    return a < b ? a : b;
  }
}
