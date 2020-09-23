import 'package:flutter/material.dart';

const Color kMainGreen = Color(0xFF2EAC4A);
const Color kMainPurple = Color(0xFF481983);
const Color kMainGrey = Color(0xFFE4E6EB);

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kLogInInputDecoration = InputDecoration(
  hintText: 'Enter your password.',
  hintStyle:
      TextStyle(fontSize: 20, color: kMainPurple, fontWeight: FontWeight.bold),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kMainGrey, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kMainPurple, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
