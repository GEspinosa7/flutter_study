import 'package:bmi_calculator/bmi_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Text(
            'Your Result',
            style: TextStyle(
              fontSize: 40.0,
              fontFamily: 'Pacifico',
            ),
          ),
          Expanded(
            child: BMICard(
              colour: kactiveBgCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'result',
                    style: kResultTextsStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '100',
                    style: kNumberTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Result Observation',
                    style: kResultTextsStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: BottomButton(text: 'Re-Calculate'),
          ),
        ],
      ),
    );
  }
}
