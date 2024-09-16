/// A utility class for validating common form fields.
///
/// This class provides static methods for validating text fields, emails,
/// passwords, and phone numbers. Each method returns an error message if the
/// validation fails or `null` if the input is valid.
class UValidator {
  /// Private constructor to prevent instantiation.
  UValidator._();

  /// Validates that a text field is not empty.
  ///
  /// Parameters:
  /// - [fieldName]: The name of the field being validated (e.g., "First Name", "Last Name").
  /// - [value]: The value of the text field.
  ///
  /// Returns an error message if the field is empty, or `null` if valid.
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.length < 3) {
      return '$fieldName is required';
    }

    return null;
  }

  /// Validates an email address format.
  ///
  /// Parameters:
  /// - [value]: The email address to be validated.
  ///
  /// Returns an error message if the email is invalid or empty, or `null` if valid.
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }

    return null;
  }

  /// Validates a password based on common security criteria.
  ///
  /// Parameters:
  /// - [value]: The password to be validated.
  ///
  /// The password must be at least 6 characters long, contain at least one
  /// uppercase letter, one number, and one special character.
  ///
  /// Returns an error message if the password does not meet the criteria, or `null` if valid.
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character.';
    }

    // Check for present of whitespace
    if (value.contains(RegExp(r'\s'))) {
      return 'Password cannot contain whteapace';
    }

    return null;
  }

  /// Validates a phone number format.
  ///
  /// Parameters:
  /// - [value]: The phone number to be validated.
  ///
  /// Assumes a 10-digit US phone number format. Adjust the regular expression
  /// as needed for different regions or formats.
  ///
  /// Returns an error message if the phone number is invalid or empty, or `null` if valid.
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    // Regular expression for phone number validation (assuming a 10-digit US phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (10 digits required).';
    }

    return null;
  }

  /// Validate if both password and confirm password matches
  static String? confirmPassword(String? value, String password) {
    if (value != password) {
      return 'Password does not match';
    }
    return null;
  }
// Add more custom validators as needed for your specific requirements.
}
