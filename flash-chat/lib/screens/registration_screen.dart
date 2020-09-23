import 'package:flash_chat/utilites/constants.dart';
import 'package:flash_chat/widgets/fc_buttons.dart';
import 'package:flash_chat/widgets/register_text_field.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'register';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainPurple,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: FlipCard(
                flipOnTouch: true,
                direction: FlipDirection.HORIZONTAL,
                front: Container(
                  height: 200.0,
                  child: Image.asset('images/logo2.png'),
                ),
                back: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            RegisterTextField(
              hintText: 'Enter your email',
              obscureText: false,
              onChanged: () {},
            ),
            SizedBox(
              height: 20.0,
            ),
            RegisterTextField(
              hintText: 'Enter your password',
              obscureText: true,
              onChanged: () {},
            ),
            SizedBox(
              height: 24.0,
            ),
            FCButtons(
              text: 'Register',
              buttonColor: kMainGrey,
              onTap: () {
                print('register');
              },
            ),
          ],
        ),
      ),
    );
  }
}
