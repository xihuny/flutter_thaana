import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'ascii_to_thaana.dart';

class ThaanaTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: thaana(newValue.text),
      selection: newValue.selection,
    );
  }
}
