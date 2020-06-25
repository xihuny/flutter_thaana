import 'package:flutter/material.dart';
import 'package:flutter_thaana/thaana_text_formatter.dart';

class ThaanaTextField extends StatefulWidget {
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
        ThaanaTextFormatter(),
      ],
      style: widget.style == null
          ? TextStyle(fontFamily: 'MVTypeWriter')
          : widget.style.copyWith(fontFamily: 'MVTypeWriter'),
    );
  }
}
