import 'constants.dart';

class PhoneNumberValidator {
  static String? validate(String value) {
    print(value);
    if (value.isEmpty) {
      return emptyTextField;
    }
    if (value.length < 10) {
      return PHONE_NUMBER_LENGTH_ERROR;
    }
    return null;
  }
}

class PasswordValidator {
  static String? validate(String value) {
    if (value.isEmpty) {
      return emptyPasswordField;
    }

    if (value.length < 4) {
      return passwordLengthError;
    }
    final regExp = RegExp(digitRegex);

    if (!regExp.hasMatch(value)) {
      return passwordDigitErr;
    }

    final regSymbolExp = RegExp(symbolRegex);

    if (!regSymbolExp.hasMatch(value)) {
      return passwordSymbolErr;
    }

    final regUpperExp = RegExp(upperCaseRegex);

    if (!regUpperExp.hasMatch(value)) {
      return passwordUppercaseErr;
    }

    return null;
  }
}

class FieldValidator {
  static String? validate(String value) {
    if (value.isEmpty) {
      return emptyTextField;
    }

    return null;
  }
}
