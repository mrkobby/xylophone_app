import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
//import 'package:flutter/services.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   systemNavigationBarColor: Colors.black,
  //   statusBarColor: Colors.black,
  // ));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Xylophone App',
    home: XPhoneApp(),
  ));
}

class XPhoneApp extends StatefulWidget {
  @override
  _XPhoneAppState createState() => _XPhoneAppState();
}

class _XPhoneAppState extends State<XPhoneApp> {
  final audioPlayer = AudioCache();

  void playSound(int soundNumber) {
    audioPlayer.play('note$soundNumber.wav');
  }

  Widget buildKeys() {
    List<Widget> keysList = new List<Widget>();
    List<Color> keysColor = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.teal,
      Colors.pink,
      Colors.purple
    ];

    for (var i = 0; i < 7; i++) {
      int soundNum = i + 1;
      keysList.add(new Expanded(
        child: FlatButton(
            color: keysColor[i],
            onPressed: () {
              playSound(soundNum);
            },
            child: null),
      ));
    }
    return new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, children: keysList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: buildKeys(),
      ),
    );
  }
}
