import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kbottomContainerBgColor,
      width: double.infinity,
      height: kbottomContainerHeight,
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.only(bottom: 10),
      child: Center(
        child: Text(
          text,
          style: kBottomButtonTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
