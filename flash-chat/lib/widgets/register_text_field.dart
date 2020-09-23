import 'package:flash_chat/utilites/constants.dart';
import 'package:flutter/material.dart';

class RegisterTextField extends StatelessWidget {
  RegisterTextField(
      {this.hintText,
      this.obscureText,
      @required this.onChanged,
      this.textType});

  final String hintText;
  final Function onChanged;
  final bool obscureText;
  final TextInputType textType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textType,
      textAlign: TextAlign.center,
      onChanged: (value) {
        onChanged(value);
      },
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 20, color: kMainGrey, fontWeight: FontWeight.bold),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kMainGreen, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kMainGrey, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
