/// Helper class used in [DateTime] formatting
class UDatetimeHelperFunction {
  // DO NOT INTIALIZE
  UDatetimeHelperFunction._();

  /// Get the exact date for the specified index in a calendar grid.
  ///
  /// This function calculates the correct date for a particular cell in the
  /// calendar grid based on the current month and year. It also accounts for
  /// dates from the previous or next month to ensure the grid shows complete weeks.
  ///
  /// Returns:
  /// - A [DateTime] object representing the calculated date for the specified index.
  static DateTime getDateForIndex(
    int index,
    DateTime currentMonthYear,
  ) {
    // Get the first day of the current month
    DateTime firstDayOfMonth =
        DateTime(currentMonthYear.year, currentMonthYear.month, 1);

    // Determine which day of the week the first day of the month falls on
    int startDayOfWeek = firstDayOfMonth.weekday % 7;
    // Sunday = 0, Monday = 1, ..., Saturday = 6
    // Localization for country date starting on Sunday

    // Weeks with Monday as first day
    // int startDayOfWeek = firstDayOfMonth.weekday - 1;
    // Sunday = 0, Monday = 1, ..., Saturday = 6

    // Find the first day that will appear in the grid (likely from the previous month)
    DateTime firstDateToDisplay =
        firstDayOfMonth.subtract(Duration(days: startDayOfWeek));

    // Calculate the exact date corresponding to the current grid index
    DateTime calculatedDate = firstDateToDisplay.add(Duration(days: index));

    return calculatedDate;
  }

  /// Returns the name of the month corresponding to the [month] value.
  /// If [isFull] is true, the full uppercase name of the month is returned (e.g., "FEBRUARY").
  /// If [isFull] is false, the short version is returned (e.g., "Feb").
  /// The [month] parameter should be an integer between 1 and 12.
  static String getNameMonth(
    int month, {
    bool isFull = true,
  }) {
    switch (month) {
      case 1:
        return isFull ? 'JANUARY' : 'Jan';
      case 2:
        return isFull ? 'FEBRUARY' : 'Feb';
      case 3:
        return isFull ? 'MARCH' : 'Mar';
      case 4:
        return isFull ? 'APRIL' : 'Apr';
      case 5:
        return isFull ? 'MAY' : 'May';
      case 6:
        return isFull ? 'JUNE' : 'Jun';
      case 7:
        return isFull ? 'JULY' : 'Jul';
      case 8:
        return isFull ? 'AUGUST' : 'Aug';
      case 9:
        return isFull ? 'SEPTEMBER' : 'Sep';
      case 10:
        return isFull ? 'OCTOBER' : 'Oct';
      case 11:
        return isFull ? 'NOVEMBER' : 'Nov';
      case 12:
        return isFull ? 'DECEMBER' : 'Dec';
      default:
        return 'INVALID MONTH';
    }
  }

  // Function to check if the date is a oldDate
  static bool isOldDate(DateTime dateTime) {
    final now = DateTime.now();
    return dateTime.isBefore(now);
  }

  // Return the formattedDateTime with days and formatted time
  static String getFormatedDateTime(DateTime dateTime) {
    final now = DateTime.now();

    // Current data without time unit
    final normalizedNow = DateTime(now.year, now.month, now.day);

    // Supplied date without time unit
    final normalizedDate =
        DateTime(dateTime.year, dateTime.month, dateTime.day);

    // Getting difference in days
    final differenceInDays = normalizedDate.difference(normalizedNow).inDays;

    String dateValue;

    // Check if the date is today
    if (differenceInDays == 0) {
      dateValue = 'Today';
    }
    // Check if the date is tomorrow
    else if (differenceInDays == 1) {
      dateValue = 'Tomorrow';
    }
    // Check if the date was yesterday
    else if (differenceInDays == -1) {
      dateValue = 'Yesterday';
    }
    // Check if the date is in a week time
    else if (differenceInDays < 6) {
      final daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
      dateValue = daysOfWeek[dateTime.weekday - 1];
    }
    // Otherwise, return the date in "dd/MM" format
    else {
      dateValue =
          '${dateTime.day.toString().padLeft(2, '0')} ${getNameMonth(dateTime.month, isFull: false)}';
    }

    // Create formatted time in format 'hh:yy'
    final formattedTime =
        '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';

    return '$dateValue at $formattedTime';
  }
}
