import 'users.dart';

class Validation {
  String valEmail(String value) {
    if (value.length < 2 || value.length > 15) {
      return "Invalid character.";
    }
  }

  String valPassword(String value) {
    if (value.length < 2 || value.length > 15) {
      return "Invalid character.";
    }
  }
}
