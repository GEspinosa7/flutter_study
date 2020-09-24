String emailValidator(String value) {
  bool isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
  }

  if (value.isEmpty) {
    return 'You must provide a email';
  }

  if (isValidEmail() == false) {
    return 'That is not a valid email';
  }

  return null;
}
