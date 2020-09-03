import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int noteNumber) {
    final player = AudioCache();
    player.play('note$noteNumber.wav');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              soundButton(color: Colors.red, noteNumber: 1),
              soundButton(color: Colors.orange, noteNumber: 2),
              soundButton(color: Colors.yellow, noteNumber: 3),
              soundButton(color: Colors.green, noteNumber: 4),
              soundButton(color: Colors.green[800], noteNumber: 5),
              soundButton(color: Colors.blue, noteNumber: 6),
              soundButton(color: Colors.purple, noteNumber: 7),
            ],
          ),
        ),
      ),
    );
  }

  Widget soundButton({color: Colors.white, noteNumber: 1}) {
    return Expanded(
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          playSound(noteNumber);
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }
}
