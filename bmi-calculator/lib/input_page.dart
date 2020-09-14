import 'package:bmi_calculator/bmi_card.dart';
import 'package:bmi_calculator/bmi_card_itens.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 80.0;
const Color bottomContainerBgColor = Color(0xFFEB1555);
const Color inactiveItemCardColor = Color(0xFF8D8E98);
const Color activeItemCardColor = Colors.white;
const Color inactiveBgCardColor = Color(0xFF111328);
const Color activeBgCardColor = Color(0xFF1D1E33);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleBgCardColor = inactiveBgCardColor;
  Color maleItemCardColor = inactiveItemCardColor;
  Color femaleBgCardColor = inactiveBgCardColor;
  Color femaleItemCardColor = inactiveItemCardColor;

  void updateColor(Gender gender) {
    if (gender == Gender.male) {
      if (maleBgCardColor == inactiveBgCardColor) {
        maleBgCardColor = activeBgCardColor;
        maleItemCardColor = activeItemCardColor;
        femaleBgCardColor = inactiveBgCardColor;
        femaleItemCardColor = inactiveItemCardColor;
      } else {
        maleBgCardColor = inactiveBgCardColor;
        maleItemCardColor = inactiveItemCardColor;
      }
    }
    if (gender == Gender.female) {
      if (femaleBgCardColor == inactiveBgCardColor) {
        femaleBgCardColor = activeBgCardColor;
        femaleItemCardColor = activeItemCardColor;
        maleBgCardColor = inactiveBgCardColor;
        maleItemCardColor = inactiveItemCardColor;
      } else {
        femaleBgCardColor = inactiveBgCardColor;
        femaleItemCardColor = inactiveItemCardColor;
      }
    }
  }

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
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.male);
                      });
                    },
                    child: BMICard(
                      colour: maleBgCardColor,
                      cardChild: BMICardItens(
                        icon: FontAwesomeIcons.mars,
                        iconColor: maleItemCardColor,
                        text: 'Male',
                        textColor: maleItemCardColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.female);
                      });
                    },
                    child: BMICard(
                      colour: femaleBgCardColor,
                      cardChild: BMICardItens(
                        icon: FontAwesomeIcons.venus,
                        iconColor: femaleItemCardColor,
                        text: 'Female',
                        textColor: femaleItemCardColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BMICard(
              colour: activeBgCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMICard(
                    colour: activeBgCardColor,
                  ),
                ),
                Expanded(
                  child: BMICard(
                    colour: activeBgCardColor,
                  ),
                ),
              ],
            ),
          ),
          FlatButton(
            padding: EdgeInsets.all(0),
            onPressed: () => print('teste'),
            child: Container(
              color: bottomContainerBgColor,
              width: double.infinity,
              height: bottomContainerHeight,
              margin: EdgeInsets.only(top: 10.0),
              child: Center(
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    color: activeBgCardColor,
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
