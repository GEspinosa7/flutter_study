import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blue[200],
          appBar: AppBar(
            title: Text(
              "The Magic 8 Ball",
              style: TextStyle(fontFamily: 'Pacifico', color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue[200],
          ),
          body: MagicBall(),
        ),
      ),
    );

class MagicBall extends StatefulWidget {
  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int ballImageNumber = 1;

  void showAnswer() {
    setState(() {
      ballImageNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Ask me and touch the ball',
            style: TextStyle(fontFamily: 'Pacifico', fontSize: 30),
          ),
          FlatButton(
            child: Image.asset('images/ball$ballImageNumber.png'),
            onPressed: () {
              showAnswer();
            },
          ),
        ],
      ),
    );
  }
}
