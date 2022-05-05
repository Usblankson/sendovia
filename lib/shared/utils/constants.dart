const String emptyUsernameField = "Username  cannot be empty";
const String passwordRegex =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
const String usernameLengthError = "Username length must be greater than 6";
const String emailRegex = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
    "\\@" +
    "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
    "(" +
    "\\." +
    "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
    ")+";
const String emptyEmailField = "Email field cannot be empty!";
const String emptyTextField = "Field cannot be empty!";
const String lessThanEleven = "Field cannot be less than 11 digits!";
const String emptyPasswordField = "Password field cannot be empty";
const String invalidEmailField =
    "Email provided isn't valid.Try another email address";
const String passwordMatchError = 'Password does not match';
const String passwordLengthError = "Password length must be greater than 8";
const String passwordStrengthError =
    "It must have at least one uppercase, lowercase, \nnumber, and symbol ";
