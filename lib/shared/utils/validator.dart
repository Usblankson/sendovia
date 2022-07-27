import 'constants.dart';

mixin InputValidationMixin {
  String _value;

  String validateEmail(String value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyEmailField;
      }
      // Regex for email validation
      RegExp regExp = RegExp(emailRegex);
      if (regExp.hasMatch(value)) {
        return "";
      }
      return invalidEmailField;
    } else {
      return "";
    }
  }

  String validatePassword(String value) {
    if (value != null) {
      _value = value;
      if (value.isEmpty) {
        return emptyPasswordField;
      }

      RegExp regExp = RegExp(passwordRegex);
      if (value.length < 8) {
        return passwordLengthError;
      }
      if (regExp.hasMatch(value)) {
        return "";
      } else {
        return passwordStrengthError;
      }
    } else {
      return "";
    }
  }

  String confirmPassword(String value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyPasswordField;
      }

      if (value != _value) {
        return passwordMatchError;
      }
    } else {
      return "";
    }
    return "";
  }

  String commonPassword(String value) {
    if (value != null) {
      _value = value;
      if (value.isEmpty) {
        return emptyPasswordField;
      }

      if (value.length < 8) {
        return passwordLengthError;
      }
    } else {
      return "";
    }
    return "";
  }

  String resetPin(String value) {
    if (value != null) {
      _value = value;
      if (value.isEmpty) {
        return emptyPasswordField;
      }

      if (value.length != 4) {
        return "Pin length must be 4";
      }
    } else {
      return "";
    }
    return "";
  }

  String validateUsername(String value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyUsernameField;
      }

      if (value.length < 6) {
        return usernameLengthError;
      }
    } else {
      return "";
    }

    return "";
  }

  String fieldValidate(String value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyTextField;
      }
    } else {
      return "";
    }

    return "";
  }
}
