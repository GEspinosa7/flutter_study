import 'package:flash_chat/utilites/constants.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  LoginTextField({
    this.hintText,
    @required this.onChanged,
    this.obscureText,
    this.textType,
    @required this.customValidator,
  });

  final String hintText;
  final Function onChanged;
  final Function customValidator;
  final bool obscureText;
  final TextInputType textType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: kMainPurple,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      keyboardType: textType,
      textAlign: TextAlign.center,
      obscureText: obscureText,
      onChanged: (value) {
        onChanged(value);
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 20, color: kMainPurple, fontWeight: FontWeight.bold),
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
      ),
      validator: customValidator,
    );
  }
}
