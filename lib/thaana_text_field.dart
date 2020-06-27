import 'package:flutter/material.dart';
import 'package:flutter_thaana/thaana_text_formatter.dart';

/*
* TextField widget with default settings of a
* Thaana TextField (textDirection & fontFamily)
*
* Usage:
*   ThaanaTextField(
*     controller: myTextEditingController,
*     style: TextStyle(...),
*   );
*/

class ThaanaTextField extends StatefulWidget {
  /*
  * Declare additional properties of a TextField if required
  * and pass it to the constructor
  */

  final TextEditingController controller;
  final TextStyle style;

  ThaanaTextField({this.controller, this.style});

  @override
  _ThaanaTextFieldState createState() => _ThaanaTextFieldState();
}

class _ThaanaTextFieldState extends State<ThaanaTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      textDirection: TextDirection.rtl,
      controller: widget.controller,
      inputFormatters: [
        ThaanaTextFormatter(), // Using our custom ThaanaTextFormatter
      ],
      style: widget.style == null
          ? TextStyle(fontFamily: 'MVTypeWriter')
          : widget.style.copyWith(fontFamily: 'MVTypeWriter'),
    );
  }
}
