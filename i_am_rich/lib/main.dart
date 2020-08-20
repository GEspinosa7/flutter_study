import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("I'm Rich"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(50),
              width: double.infinity,
              child: Center(
                child: Text(
                  'Congratulations, you are rich enough to expend money without regrets',
                  style: TextStyle(color: Colors.red, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Image(
                // width: 300,
                // height: 300,
                image: AssetImage('images/diamonds.gif')),
            Image(
                // width: 300,
                // height: 300,
                image: AssetImage('images/diamonds.gif')),
          ],
        ),
      ),
    ),
  );
}
