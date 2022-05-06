import 'constants.dart';


mixin InputValidationMixin {
  String? _value;

  String? validateEmail(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyEmailField;
      }
      // Regex for email validation
      RegExp regExp = RegExp(emailRegex);
      if (regExp.hasMatch(value)) {
        return null;
      }
      return invalidEmailField;
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
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
        return null;
      } else {
        return passwordStrengthError;
      }
    } else {
      return null;
    }
  }

  String? confirmPassword(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyPasswordField;
      }

      if (value != _value) {
        return passwordMatchError;
      }
    } else {
      return null;
    }
    return null;
  }

  String? commonPassword(String? value) {
    if (value != null) {
      _value = value;
      if (value.isEmpty) {
        return emptyPasswordField;
      }

      if (value.length < 8) {
        return passwordLengthError;
      }
    } else {
      return null;
    }
    return null;
  }

  String? resetPin(String? value) {
    if (value != null) {
      _value = value;
      if (value.isEmpty) {
        return emptyPasswordField;
      }

      if (value.length != 4) {
        return "Pin length must be 4";
      }
    } else {
      return null;
    }
    return null;
  }

  String? validateUsername(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyUsernameField;
      }

      if (value.length < 6) {
        return usernameLengthError;
      }
    } else {
      return null;
    }

    return null;
  }

  String? fieldValidate(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyTextField;
      }
    } else {
      return null;
    }

    return null;
  }
}




