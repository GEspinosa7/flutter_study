import 'package:flash_chat/utilites/constants.dart';
import 'package:flutter/material.dart';

class FCButtons extends StatelessWidget {
  FCButtons(
      {this.text,
      this.buttonColor,
      @required this.onTap,
      this.textColor = kMainPurple});

  final String text;
  final Color buttonColor;
  final Color textColor;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 15.0,
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            onTap();
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 25,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
