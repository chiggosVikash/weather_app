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
}
