class UCalenderHelperFunction {
  // DO NOT INTIALIZE
  UCalenderHelperFunction._();

  /// Get the exact date for the specified index in a calendar grid.
  ///
  /// This function calculates the correct date for a particular cell in the
  /// calendar grid based on the current month and year. It also accounts for
  /// dates from the previous or next month to ensure the grid shows complete weeks.
  ///
  /// Parameters:
  /// - [index]: The index of the cell in the calendar grid (0-based).
  /// - [currentMonth]: A DateTime object representing the current month.
  /// - [currenYear]: A DateTime object representing the current year.
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

    // // Determine which day of the week the first day of the month falls on
    int startDayOfWeek = firstDayOfMonth.weekday %
        7; // Sunday = 0, Monday = 1, ..., Saturday = 6

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

  /// Function to get the name of month from the month value from a datetime
  static String getNameMonth(int month) {
    switch (month) {
      case 1:
        return 'JANUARY';
      case 2:
        return 'FEBRUARY';
      case 3:
        return 'MARCH';
      case 4:
        return 'APRIL';
      case 5:
        return 'MAY';
      case 6:
        return 'JUNE';
      case 7:
        return 'JULY';
      case 8:
        return 'AUGUST';
      case 9:
        return 'SEPTEMBER';
      case 10:
        return 'OCTOBER';
      case 11:
        return 'NOVEMBER';
      case 12:
        return 'DECEMBER';
      default:
        return 'INVALID MONTH';
    }
  }
}
