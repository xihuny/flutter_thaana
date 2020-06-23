import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_thaana/ascii_to_thaana.dart';
import 'package:flutter_thaana/latin_to_ascii.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xff252627),
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Thaana',
        theme: ThemeData(
          primaryColor: Color(0xffBB0A21),
          cursorColor: Color(0xffBB0A21),
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
  TextEditingController latinToThaanaController = TextEditingController();

  String latinToThaanaOutput = '';

  latinToThaana() {
    setState(() {
      String ascii = latinToAscii(latinToThaanaController.text);
      latinToThaanaOutput = thaana(ascii);
    });
  }

  @override
  void initState() {
    super.initState();
    latinToThaanaController.addListener(latinToThaana);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xff252627),
      child: SafeArea(
        child: SizedBox.expand(
          child: Container(
              color: Color(0xff252627),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
//          Padding(
//            padding: const EdgeInsets.symmetric(horizontal: 16),
//            child: TextField(
//              textDirection: TextDirection.rtl,
//              textAlign: TextAlign.center,
//              keyboardType: TextInputType.multiline,
//              maxLines: null,
//              autocorrect: false,
//              enableSuggestions: false,
//              decoration: InputDecoration(
//                hintText: 'ތާނަ އަކުރުން ލިޔުމަށް',
//              ),
//              style: TextStyle(
//                fontFamily: 'Faruma',
//                fontSize: 20,
//              ),
//              inputFormatters: [
//                ThaanaTextFormatter(),
//              ],
//              controller: tec,
//            ),
//          ),
//          SizedBox(
//            height: 15,
//          ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 2,
                      autocorrect: false,
                      enableSuggestions: false,
                      textAlign: TextAlign.center,
                      controller: latinToThaanaController,
                      decoration: InputDecoration(
                        hintText: 'Latin to Thaana',
                        hintStyle: TextStyle(
                          color: Colors.white12,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        fontFamily: 'Default',
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Flexible(
                      child: Text(
                        latinToThaanaOutput,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontFamily: 'MVTypewriter',
                          fontSize: 25,
                          color: Colors.white,
                          height: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
