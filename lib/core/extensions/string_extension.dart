extension StringExtension on String {
  bool isValidMobileNum() {
    return RegExp(r'^[0-9]{10}$').hasMatch(this);
  }

  bool isValidEmail() {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(this);
  }
}
