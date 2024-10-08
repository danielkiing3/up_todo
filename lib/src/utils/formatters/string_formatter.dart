class UStringFormatter {
  /// -- DO NOT INITIALIZE CLASS
  UStringFormatter._();

  static String formatPhoneNumber(String phoneNumber) {
    // Assuming a 10-digit US phone number format: (123) 456-7890
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    }
    // Add more custom phone number formatting logic for different formats if needed.
    return phoneNumber;
  }

  // Format app name
  static String formatAppNameString(String input) {
    // Check if the string contains underscores
    if (input.contains('_')) {
      // Split the string by underscores and capitalize each word
      return input
          .split('_')
          .map((word) => word[0].toUpperCase() + word.substring(1))
          .join(' ');
    } else {
      // If the string doesn't have underscores, just capitalize the first letter
      return input[0].toUpperCase() + input.substring(1);
    }
  }

  /// Converts a given time in double format to a string representing
  /// hours and minutes.
  ///
  /// For example:
  /// - 2.5 will be converted to "2h 30m"
  /// - 0.5 will be converted to "30m"
  /// - 1.0 will be converted to "1h"
  ///
  /// Parameters:
  /// - [time]: A double representing the time in hours.
  ///
  /// Returns:
  /// - A string representing the time in hours and minutes.
  static String formatTime(double time) {
    int hours = time.floor();
    int minutes = ((time - hours) * 60).round();

    if (hours > 0 && minutes > 0) {
      return '${hours}h ${minutes}m';
    } else if (hours > 0) {
      return '${hours}h';
    } else {
      return '${minutes}m';
    }
  }

  // Not fully tested.
  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Remove any non-digit characters from the phone number
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Extract the country code from the digitsOnly
    String countryCode = '+${digitsOnly.substring(0, 2)}';
    digitsOnly = digitsOnly.substring(2);

    // Add the remaining digits with proper formatting
    final formattedNumber = StringBuffer();
    formattedNumber.write('($countryCode) ');

    int i = 0;
    while (i < digitsOnly.length) {
      int groupLength = 2;
      if (i == 0 && countryCode == '+1') {
        groupLength = 3;
      }

      int end = i + groupLength;
      formattedNumber.write(digitsOnly.substring(i, end));

      if (end < digitsOnly.length) {
        formattedNumber.write(' ');
      }
      i = end;
    }

    return formattedNumber.toString();
  }
}
