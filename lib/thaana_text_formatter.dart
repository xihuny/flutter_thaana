import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'thaana_extensions.dart';

/*
* Input Formatter for TextFields which will convert the
* value of TextField to Thaana after every text change
*/

class ThaanaTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.convertAsciiToThaana(),
      selection: newValue.selection,
    );
  }
}
