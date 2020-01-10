import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Thaana',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController tec = TextEditingController();

  String thaana(String s) {
    String strThaana = '';
    for (int i = 0; i < s.length; i++) {
      strThaana += getThaana(s.codeUnitAt(i));
    }

    return strThaana;
  }

  String getThaana(int s) {
    if (s == 'h'.codeUnitAt(0))
      return '\u0780';
    else if (s == 'S'.codeUnitAt(0))
      return '\u0781';
    else if (s == 'n'.codeUnitAt(0))
      return '\u0782';
    else if (s == 'r'.codeUnitAt(0))
      return '\u0783';
    else if (s == 'b'.codeUnitAt(0))
      return '\u0784';
    else if (s == 'L'.codeUnitAt(0))
      return '\u0785';
    else if (s == 'k'.codeUnitAt(0))
      return '\u0786';
    else if (s == 'w'.codeUnitAt(0))
      return '\u0787';
    else if (s == 'v'.codeUnitAt(0))
      return '\u0788';
    else if (s == 'm'.codeUnitAt(0))
      return '\u0789';
    else if (s == 'f'.codeUnitAt(0))
      return '\u078A';
    else if (s == 'd'.codeUnitAt(0))
      return '\u078B';
    else if (s == 't'.codeUnitAt(0))
      return '\u078C';
    else if (s == 'l'.codeUnitAt(0))
      return '\u078D';
    else if (s == 'g'.codeUnitAt(0))
      return '\u078E';
    else if (s == 'N'.codeUnitAt(0))
      return '\u078F';
    else if (s == 's'.codeUnitAt(0))
      return '\u0790';
    else if (s == 'D'.codeUnitAt(0))
      return '\u0791';
    else if (s == 'z'.codeUnitAt(0))
      return '\u0792';
    else if (s == 'T'.codeUnitAt(0))
      return '\u0793';
    else if (s == 'y'.codeUnitAt(0))
      return '\u0794';
    else if (s == 'p'.codeUnitAt(0))
      return '\u0795';
    else if (s == 'j'.codeUnitAt(0))
      return '\u0796';
    else if (s == 'c'.codeUnitAt(0))
      return '\u0797';
    else if (s == 'X'.codeUnitAt(0))
      return '\u0798';
    else if (s == 'H'.codeUnitAt(0))
      return '\u0799';
    else if (s == 'K'.codeUnitAt(0))
      return '\u079A';
    else if (s == 'J'.codeUnitAt(0))
      return '\u079B';
    else if (s == 'R'.codeUnitAt(0))
      return '\u079C';
    else if (s == 'C'.codeUnitAt(0))
      return '\u079D';
    else if (s == 'M'.codeUnitAt(0))
      return '\u079E';
    else if (s == 'B'.codeUnitAt(0))
      return '\u079F';
    else if (s == 'Y'.codeUnitAt(0))
      return '\u07A0';
    else if (s == 'Z'.codeUnitAt(0))
      return '\u07A1';
    else if (s == 'W'.codeUnitAt(0))
      return '\u07A2';
    else if (s == 'G'.codeUnitAt(0))
      return '\u07A3';
    else if (s == 'Q'.codeUnitAt(0))
      return '\u07A4';
    else if (s == 'V'.codeUnitAt(0))
      return '\u07A5';
    else if (s == 'a'.codeUnitAt(0))
      return '\u07A6';
    else if (s == 'A'.codeUnitAt(0))
      return '\u07A7';
    else if (s == 'i'.codeUnitAt(0))
      return '\u07A8';
    else if (s == 'I'.codeUnitAt(0))
      return '\u07A9';
    else if (s == 'u'.codeUnitAt(0))
      return '\u07AA';
    else if (s == 'U'.codeUnitAt(0))
      return '\u07AB';
    else if (s == 'e'.codeUnitAt(0))
      return '\u07AC';
    else if (s == 'E'.codeUnitAt(0))
      return '\u07AD';
    else if (s == 'o'.codeUnitAt(0))
      return '\u07AE';
    else if (s == 'O'.codeUnitAt(0))
      return '\u07AF';
    else if (s == 'q'.codeUnitAt(0))
      return '\u07B0';
    else if (s == 'F'.codeUnitAt(0))
      return '\uFDF2';
    else if (s == '?'.codeUnitAt(0))
      return '\u061F';
    else if (s == 'x'.codeUnitAt(0))
      return '\u00D7';
    else if (s == 'P'.codeUnitAt(0))
      return '\u00F7';
    else if (s == ';'.codeUnitAt(0))
      return '\u061B';
    else if (s == ','.codeUnitAt(0))
      return '\u060C';
    else
      return String.fromCharCode(s);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Enter text here'),
          TextField(
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            controller: tec,
            onChanged: (s) {
              tec.text = thaana(s);
              tec.selection = TextSelection.collapsed(offset: tec.text.length);
            },
          ),
        ],
      )),
    );
  }
}
