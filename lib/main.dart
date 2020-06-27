import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';

import 'thaana_extensions.dart';

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
        theme: ThemeData(fontFamily: 'MVTypewriter'),
        home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController latinToThaanaController = TextEditingController();

  String latinToThaanaOutput = '';

  latinToThaana() {
    setState(() {
      latinToThaanaOutput = latinToThaanaController.text.convertLatinToThaana();
    });
  }

  /*
  * Flutter apps run at 60fps. By default you will get 60 fps even if your
  * device's display refresh rate is greater than 60Hz. So, here telling the
  * app to get all available display modes and use the best display mode
  * supported by the device.
  */
  initFlutterDisplayMode() async {
    try {
      // Fetch all the display modes supported by the device
      List<DisplayMode> modes = await FlutterDisplayMode.supported;

      // I'm setting the best display mode for my device here. So, do a check
      // and change accordingly.
      if (modes.length > 3) await FlutterDisplayMode.setMode(modes[2]);
    } on PlatformException catch (e) {
      debugPrint(e.message);
    }
  }

  @override
  void initState() {
    super.initState();
    latinToThaanaController.addListener(latinToThaana);
    initFlutterDisplayMode();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xff252627),
      child: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ލެޓިން ތާނައަށް ބަދަލުކުރުން',
                    style: TextStyle(
                      color: Colors.white30,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  autocorrect: false,
                  enableSuggestions: false,
                  controller: latinToThaanaController,
                  decoration: InputDecoration(
                    hintText: 'Write in Latin here...',
                    hintStyle: TextStyle(
                      color: Colors.white12,
                    ),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontFamily: 'Default',
                    fontSize: 23,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Divider(
                  color: Colors.white12,
                ),
              ),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                child: Text(
                  latinToThaanaOutput,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontFamily: 'MVTypewriter',
                    fontSize: 18,
                    color: Colors.white,
                    height: 2,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              OutlineButton(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                child: Text(
                  'ނަކަލު ކޮށްލާ',
                  style: TextStyle(color: Colors.white38, fontSize: 16),
                ),
                borderSide: BorderSide(
                  color: Colors.white38,
                ),
                highlightedBorderColor: Colors.white38,
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: latinToThaanaOutput));
                },
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
