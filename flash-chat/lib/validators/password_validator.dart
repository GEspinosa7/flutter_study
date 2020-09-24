String passValidator(String value) {
  if (value.isEmpty) {
    return 'You must provide a password';
  }

  if (value.length < 6) {
    return 'Your password must have at least\n 6 characters';
  }
  return null;
}
