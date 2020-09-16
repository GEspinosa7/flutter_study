import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.bgcolor, @required this.onTap, @required this.icon});

  final Color bgcolor;
  final Function onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onTap();
      },
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: bgcolor,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      child: Icon(
        icon,
        size: 50.0,
        color: Colors.white,
      ),
    );
  }
}

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
