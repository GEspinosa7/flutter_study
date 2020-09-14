import 'package:bmi_calculator/bmi_card.dart';
import 'package:bmi_calculator/bmi_card_itens.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMICard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kactiveBgCardColor
                        : kinactiveBgCardColor,
                    cardChild: BMICardItens(
                      icon: FontAwesomeIcons.mars,
                      iconColor: selectedGender == Gender.male
                          ? kactiveItemCardColor
                          : kinactiveItemCardColor,
                      text: 'Male',
                      textColor: selectedGender == Gender.male
                          ? kactiveItemCardColor
                          : kinactiveItemCardColor,
                    ),
                  ),
                ),
                Expanded(
                  child: BMICard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kactiveBgCardColor
                        : kinactiveBgCardColor,
                    cardChild: BMICardItens(
                      icon: FontAwesomeIcons.venus,
                      iconColor: selectedGender == Gender.female
                          ? kactiveItemCardColor
                          : kinactiveItemCardColor,
                      text: 'Female',
                      textColor: selectedGender == Gender.female
                          ? kactiveItemCardColor
                          : kinactiveItemCardColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BMICard(
              colour: kactiveBgCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    textAlign: TextAlign.center,
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kHeightTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                    min: 120.0,
                    max: 220.0,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMICard(
                    colour: kactiveBgCardColor,
                  ),
                ),
                Expanded(
                  child: BMICard(
                    colour: kactiveBgCardColor,
                  ),
                ),
              ],
            ),
          ),
          FlatButton(
            padding: EdgeInsets.all(0),
            onPressed: () => print('teste'),
            child: Container(
              color: kbottomContainerBgColor,
              width: double.infinity,
              height: kbottomContainerHeight,
              margin: EdgeInsets.only(top: 10.0),
              child: Center(
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    color: kactiveBgCardColor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
