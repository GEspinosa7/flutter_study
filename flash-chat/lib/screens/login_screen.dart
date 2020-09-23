import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/chat_screen.dart';
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
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

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
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            LoginTextField(
              hintText: 'Enter your password',
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(
              height: 24.0,
            ),
            FCButtons(
              text: 'Log in',
              textColor: Colors.white,
              buttonColor: kMainPurple,
              onTap: () async {
                try {
                  final existingUser = await _auth.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  if (existingUser != null) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
