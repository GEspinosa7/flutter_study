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
  int weight = 40;
  int age = 10;

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
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Color(0xFFEB1555),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      min: 120.0,
                      max: 220.0,
                    ),
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
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'Kg',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        weight == 0
                            ? RoundIconButton(
                                bgcolor: kPlusButton,
                                icon: Icons.add,
                                onTap: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  RoundIconButton(
                                    bgcolor: kMinusButton,
                                    icon: Icons.remove,
                                    onTap: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  ),
                                  RoundIconButton(
                                    bgcolor: kPlusButton,
                                    icon: Icons.add,
                                    onTap: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  )
                                ],
                              )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BMICard(
                    colour: kactiveBgCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'yo',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        age == 0
                            ? RoundIconButton(
                                bgcolor: kPlusButton,
                                icon: Icons.add,
                                onTap: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  RoundIconButton(
                                    bgcolor: kMinusButton,
                                    icon: Icons.remove,
                                    onTap: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
                                  RoundIconButton(
                                    bgcolor: kPlusButton,
                                    icon: Icons.add,
                                    onTap: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: buttonShouldBeVisible(),
            child: FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () => test(),
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
            ),
          )
        ],
      ),
    );
  }

  void test() {
    print(selectedGender);
    print('age');
    print(age);
    print('weight');
    print(weight);
    print('height');
    print(height);
  }

  bool buttonShouldBeVisible() {
    if (selectedGender == null) {
      return false;
    } else {
      return true;
    }
  }
}

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
