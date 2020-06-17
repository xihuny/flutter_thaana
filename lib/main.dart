import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_thaana/thaana_text_formatter.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'ބޭނުން އެއްޗެއް ލިޔަންވީ',
            style: TextStyle(
                fontFamily: 'Faruma',
                fontSize: 23,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              autocorrect: false,
              enableSuggestions: false,
              style: TextStyle(
                fontFamily: 'Faruma',
                fontSize: 20,
              ),
              inputFormatters: [
                ThaanaTextFormatter(),
              ],
              controller: tec,
            ),
          ),
        ],
      )),
    );
  }
}
