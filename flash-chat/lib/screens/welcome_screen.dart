import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/utilites/constants.dart';
import 'package:flash_chat/widgets/fc_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController aController;
  Animation animation;

  @override
  void initState() {
    super.initState();

    aController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    animation = CurvedAnimation(parent: aController, curve: Curves.linear);
    aController.forward();
    aController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    aController.dispose();
    super.dispose();
  }

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
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: animation.value * 100,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  totalRepeatCount: 2,
                  speed: Duration(milliseconds: 90),
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            FCButtons(
              text: 'Log in',
              textColor: Colors.white,
              buttonColor: kMainGreen,
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            FCButtons(
              text: 'Register',
              buttonColor: kMainGrey,
              onTap: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
