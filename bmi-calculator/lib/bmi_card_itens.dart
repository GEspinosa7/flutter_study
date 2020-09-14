import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BMICardItens extends StatelessWidget {
  BMICardItens({
    @required this.icon,
    this.iconColor,
    @required this.text,
    this.textColor,
  });

  final IconData icon;
  final Color iconColor;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: iconColor,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
