bool isValidName(String name) {
  List<String> words = name.trim().split(RegExp(r'\s+'));
  return words.length >= 3;
}

bool isValidEmail (String email){
  return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

}

bool isValidPassword(String password) {
  if (password.length < 8) return false;

  bool hasUpperCase = password.contains(RegExp(r'[A-Z]'));
  bool hasLowerCase = password.contains(RegExp(r'[a-z]'));
  bool hasDigit = password.contains(RegExp(r'\d'));
  bool hasSpecialChar = password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));

  return hasUpperCase && hasLowerCase && hasDigit && hasSpecialChar;
}
