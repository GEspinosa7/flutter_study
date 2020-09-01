import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Dicee', style: TextStyle(fontFamily: 'Pacifico')),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int result = 0;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;

      result = leftDiceNumber + rightDiceNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        result == 0 ? "Let's Play" : result.toString(),
        style: TextStyle(
            color: Colors.white, fontSize: 50, fontFamily: 'Pacifico'),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
      Container(
        margin: EdgeInsets.only(top: 50),
        height: 50,
        width: 150,
        child: RaisedButton(
          color: Colors.white,
          onPressed: () {
            changeDiceFace();
          },
          splashColor: Colors.black,
          child: Text(
            'Play',
            style: TextStyle(
                color: Colors.red, fontSize: 25, fontFamily: 'Pacifico'),
          ),
        ),
      ),
    ]);
  }
}
