import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("I'm Poor"),
        centerTitle: true,
        backgroundColor: Colors.brown[700],
      ),
      body: Center(
          child: Image(
        image: AssetImage('images/coal.png'),
      )),
    ),
  ));
}
