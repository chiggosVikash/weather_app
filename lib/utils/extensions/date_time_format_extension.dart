import 'package:intl/intl.dart';

extension DateTimeFormatExtension on String {
  String get t12hrsTimeFormat {
    try {
      final date = DateTime.parse(this);
      final time = DateFormat("hh:mm a").format(date);
      return time;
    } catch (e) {
      return "DateFormatError";
    }
  }

  String get dayDateFormat {
    try {
      final date = DateTime.parse(this);
      final time = DateFormat("EEE,d MMM").format(date);
      return time;
    } catch (e) {
      return "DateFormatError";
    }
  }
}
