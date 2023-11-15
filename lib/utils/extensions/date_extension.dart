extension DateExtension on DateTime {
  String get onlyDate {
    try {
      final date =
          "$year-${month.toString().length == 1 ? "0$month" : month}-${day.toString().length == 1 ? "0$day" : day}";
      return date;
    } catch (e) {
      return "DateFormatError";
    }
  }
}
