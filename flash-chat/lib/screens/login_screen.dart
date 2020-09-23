import 'package:flash_chat/utilites/constants.dart';
import 'package:flash_chat/widgets/fc_buttons.dart';
import 'package:flash_chat/widgets/login_text_field.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String senha = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainGreen,
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
                  child: Image.asset('images/logo.png'),
                ),
                back: Container(
                  height: 200.0,
                  child: Image.asset('images/logo2.png'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            LoginTextField(
              hintText: 'Enter your email',
              obscureText: false,
              onChanged: (value) {},
            ),
            SizedBox(
              height: 20.0,
            ),
            LoginTextField(
              hintText: 'Enter your password',
              obscureText: true,
              onChanged: (value) {},
            ),
            SizedBox(
              height: 24.0,
            ),
            FCButtons(
              text: 'Log in',
              textColor: Colors.white,
              buttonColor: kMainPurple,
              onTap: () {
                print('test');
              },
            ),
          ],
        ),
      ),
    );
  }
}
