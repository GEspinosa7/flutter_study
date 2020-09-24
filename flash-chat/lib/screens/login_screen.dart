import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/utilites/constants.dart';
import 'package:flash_chat/validators/email_validator.dart';
import 'package:flash_chat/validators/password_validator.dart';
import 'package:flash_chat/widgets/fc_buttons.dart';
import 'package:flash_chat/widgets/login_text_field.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool spinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainGreen,
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Hero(
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
                  customValidator: emailValidator,
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
                  customValidator: passValidator,
                ),
                SizedBox(
                  height: 24.0,
                ),
                FCButtons(
                  text: 'Log in',
                  textColor: Colors.white,
                  buttonColor: kMainPurple,
                  onTap: () async {
                    _login();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _login() async {
    if (_form.currentState.validate()) {
      _form.currentState.save();
      setState(() {
        spinner = true;
      });
      try {
        final existingUser = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (existingUser != null) {
          Navigator.pushReplacementNamed(context, ChatScreen.id);
        }

        setState(() {
          spinner = false;
        });
      } catch (e) {
        print(e);
      }
    }
  }
}
